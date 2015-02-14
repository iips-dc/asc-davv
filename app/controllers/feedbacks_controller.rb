class FeedbacksController < ApplicationController
  before_filter :set_feedback, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  layout "adminDashboard"
  respond_to :html

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    respond_with(@feedback)
  end

  def new
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  def edit
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.save
    respond_with(@feedback)
  end

  def update
    @feedback.update_attributes(params[:feedback])
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end
end
