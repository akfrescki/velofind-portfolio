class ReportMailer < ApplicationMailer
  default from: 'velofind@gmail.com'

  def send_report(report, match)
    @report = report
    @match = match

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'reports/pdf', layout: 'pdf')
    )

    attachments["report_#{@report.id}.pdf"] = pdf

    mail(to: 'axelhouillier@yahoo.fr', subject: 'Your Police Report PDF')
  end
end
