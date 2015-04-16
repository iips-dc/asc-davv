class FeedbacksController < ApplicationController
  before_filter :set_feedback, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  load_and_authorize_resource
  layout "adminDashboard"

  respond_to :html, :json, :except => :index

  def index
    @filterrific = initialize_filterrific(
    Feedback,
    params[:filterrific],
    select_options: {
        sorted_by: Feedback.options_for_sorted_by
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by ],
    ) or return

    @feedbacks = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
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
    
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to recorded_path }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feedback.update_attributes(params[:feedback])
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end

  def report_iframe
    render :layout => false
  end 

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end
end
