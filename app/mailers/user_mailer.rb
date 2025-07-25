class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def send_report_email
    @report = params[:report]
    @user = params[:user]

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'reports/show', layout: 'pdf')
    )

    attachments["report_#{@report.id}.pdf"] = pdf

    @url = "http://localhost:3000/bikes/#{@report.match.bike.id}/matches/#{@report.match.id}/reports/#{@report.id}/email"

    mail(to: @report.match.bike.user.email, subject: 'Your Police Report PDF')
  end
end
