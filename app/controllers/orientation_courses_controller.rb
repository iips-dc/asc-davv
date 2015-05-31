  class OrientationCoursesController < ApplicationController
  before_filter :set_orientation_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record] 
  load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  respond_to :html, :js, :json, :xlsx

  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  def show
    respond_with(@orientation_course)
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

    @orientation_courses = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
  end

  def new
    @orientation_course = OrientationCourse.new
    respond_with(@orientation_course)
  end

  def edit
  end

  def create
    @orientation_course = OrientationCourse.new(params[:orientation_course])
    respond_to do |format|
      if @orientation_course.save
        format.html { redirect_to registered_path }
        format.json { render json: @orientation_course, status: :created, location: @orientation_course }
      else
        format.html { render action: "new" }
        format.json { render json: @orientation_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @orientation_course.update_attributes(params[:orientation_course])
    respond_with(@orientation_course)
  end

  def destroy
    @orientation_course = OrientationCourse.find(params[:id])
    @orientation_course.destroy

    respond_to do |format|
      format.html { redirect_to orientation_record_path}
      format.json { head :no_content }
    end
  end

  private
    def set_orientation_course
      @orientation_course = OrientationCourse.find(params[:id])
    end
end
