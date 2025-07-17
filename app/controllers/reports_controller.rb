class ReportsController < ApplicationController
  # it will find the match_id
  before_action :set_match
  # makes sure bike belongs to the current user logged in
  before_action :authorize_match

  def index
    @reports = @match.report
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    authorize @report
    if @report.save
      redirect_to dashboard_path, notice: "Report created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def authorize_match
    authorize @match
  end

  def report_params
    params.require(:report).permit(:match_id)
  end
end
