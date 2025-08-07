class ReportsController < ApplicationController
  # it will find the match_id
  before_action :set_match

  def index
    @reports = Report.all
    authorize @match
  end

  def new
    @report = Report.new(match: @match)
    @bike = Bike.find(params[:bike_id])

    authorize @report
  end

  def create
    @report = Report.new(report_params)
    @bike = Bike.find(params[:bike_id])

    authorize @report
    if @report.save
      redirect_to bike_match_report_path(@bike, @match, @report), notice: "Report created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @report = Report.find(params[:id])
    @bike = Bike.find(params[:bike_id])
    authorize @report
    generate_pdf
  end

  def generate_pdf
    @report = Report.find(params[:id])
    @bike = Bike.find(params[:bike_id])
    authorize @report

    respond_to do |f|
      f.html
      puts "Rendering PDF for report: #{@report.id}"
      puts "Template path: #{Rails.root.join('app/views/reports/show.pdf.erb')}"
      puts "File exists?: #{File.exist?(Rails.root.join('app/views/reports/show.pdf.erb'))}"
      f.pdf do
        render pdf: "report_#{@report.id}",
               filename: "report_#{@report.id}.pdf",
               template: "reports/pdf",
               formats: [:html],
               layout: "pdf",
               disposition: 'attachment'
      end
    end
  end

  def send_email
    @report = Report.find(params[:id])
    @user = @report.match.bike.user
    @bike = Bike.find(params[:bike_id])
    authorize @report
    generate_pdf
    ReportMailer.send_report(@report, @report.match).deliver_now
    redirect_to dashboard_path, flash: { notice: "Email sent with PDF!" }
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def report_params
    params.require(:report).permit(:match_id)
  end
end
