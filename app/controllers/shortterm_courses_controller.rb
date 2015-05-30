class ShorttermCoursesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record]
  load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  # GET /shortterm_courses
  # GET /shortterm_courses.json
  def index
    raise ActionController::RoutingError.new('Not Found')      
  end
  # GET /shortterm_courses/1
  # GET /shortterm_courses/1.json
  def show
    @shortterm_course = ShorttermCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shortterm_course }
    end
  end

  #List of record
  def record
    @filterrific = initialize_filterrific(
    ShorttermCourse,
    params[:filterrific],
    select_options: {
        sorted_by: ShorttermCourse.options_for_sorted_by,
        with_course_name: Course.where("LOWER(course_type)='short-term course'").pluck(:course_name)
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by,
        :search_query,
        :with_course_name ],
    ) or return

    @shortterm_courses = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
  end

  # GET /shortterm_courses/new
  # GET /shortterm_courses/new.json
  def new
    @shortterm_course = ShorttermCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shortterm_course }
    end
  end

  # GET /shortterm_courses/1/edit
  def edit
    @shortterm_course = ShorttermCourse.find(params[:id])
  end

  # POST /shortterm_courses
  # POST /shortterm_courses.json
  def create
    @shortterm_course = ShorttermCourse.new(params[:shortterm_course])

    respond_to do |format|
      if @shortterm_course.save
        format.html { redirect_to shortterm_registered_path }
        format.json { render json: @shortterm_course, status: :created, location: @shortterm_course }
      else
        format.html { render action: "new" }
        format.json { render json: @shortterm_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shortterm_courses/1
  # PUT /shortterm_courses/1.json
  def update
    @shortterm_course = ShorttermCourse.find(params[:id])

    respond_to do |format|
      if @shortterm_course.update_attributes(params[:shortterm_course])
        format.html { redirect_to @shortterm_course, notice: 'Shortterm course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shortterm_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortterm_courses/1
  # DELETE /shortterm_courses/1.json
  def destroy
    @shortterm_course = ShorttermCourse.find(params[:id])
    @shortterm_course.destroy

    respond_to do |format|
      format.html { redirect_to shortterm_record_path}
      format.json { head :no_content }
    end
  end
end
