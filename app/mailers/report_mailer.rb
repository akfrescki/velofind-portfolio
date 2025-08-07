class ReportMailer < ApplicationMailer
  default from: 'velofind@gmail.com'

  def send_report(report, match)
    @report = report
    @match = match

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'reports/pdf', layout: 'pdf')
    )

    attachments["Report_#{@report.match.bike.user.first_name}_#{@report.match.bike.user.last_name}_#{@report.id}.pdf"] = pdf

    mail(to: 'karolinefrescki@gmail.com', subject: 'Your Velofind lost bike report')

  end
end
