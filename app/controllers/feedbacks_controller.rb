class FeedbacksController < ApplicationController
  before_filter :set_feedback, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  load_and_authorize_resource
  layout "adminDashboard"

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
    respond_to :html, :json
    respond_with(@feedback)
  end

  def new
    @feedback = Feedback.new
    respond_to :html, :json
    respond_with(@feedback)
  end

  def edit
    respond_to :html, :json
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
    respond_to :html, :json
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_to :html, :json
    respond_with(@feedback)
  end

  def report_iframe
    respond_to :html, :json
    render :layout => false
  end 

  private
    def set_feedback
      respond_to :html, :json
      @feedback = Feedback.find(params[:id])
    end
end
