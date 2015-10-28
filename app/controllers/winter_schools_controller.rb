class WinterSchoolsController < ApplicationController
  before_filter :set_winter_school, only: [:show, :edit, :update, :destroy, :registered]
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record] 
  load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  respond_to :html, :js, :json, :xlsx

  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  def show
    respond_with(@winter_school)
  end

  def registered
    respond_with(@winter_school)
  end

  def record
    @filterrific = initialize_filterrific(
    OrientationCourse,
    params[:filterrific],
    select_options: {
        sorted_by: OrientationCourse.options_for_sorted_by,
        with_course_name: Course.where("LOWER(course_type)='orientation course'").pluck(:course_name)
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by,
        :search_query,
        :with_course_name ],
    ) or return

    @winter_schools = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
  end

  def new
    @winter_school = OrientationCourse.new
    respond_with(@winter_school)
  end

  def edit
  end

  def create
    @winter_school = OrientationCourse.new(params[:winter_school])
    respond_to do |format|
      if @winter_school.save
        format.html { redirect_to "/orientation_registered/#{@winter_school.id}" }
        format.json { render json: @winter_school, status: :created, location: @winter_school }
      else
        format.html { render action: "new" }
        format.json { render json: @winter_school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @winter_school.update_attributes(params[:winter_school])
    respond_with(@winter_school)
  end

  def destroy
    @winter_school.destroy

    respond_to do |format|
      format.html { redirect_to orientation_record_path}
      format.json { head :no_content }
    end
  end

  private
    def set_winter_school
      @winter_school = OrientationCourse.find(params[:id])
    end
end
