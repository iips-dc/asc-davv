class NoticesController < ApplicationController
  before_filter :set_notice, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  load_and_authorize_resource  
  layout "adminDashboard"

  respond_to :html

  def index
    @notices = Kaminari.paginate_array(Notice.all).page(params[:page]).per(25)
    respond_with(@notices)
  end

  def show
    respond_with(@notice)
  end

  def new
    @notice = Notice.new
    respond_with(@notice)
  end

  def edit
  end

  def create
    @notice = Notice.new(params[:notice])
    
    respond_to do |format|
      if @notice.save
        format.html { redirect_to courses_success_path }
        format.json { render json: @notice, status: :created, location: @notice }
      else
        format.html { render action: "new" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @notice.update_attributes(params[:notice])
    respond_with(@notice)
  end

  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to admin_path}
      format.json { head :no_content }
    end
  end

  private
    def set_notice
      @notice = Notice.find(params[:id])
    end
end
