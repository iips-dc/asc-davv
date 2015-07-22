class CoursesController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource 
  layout "adminDashboard"
  # GET /courses
  # GET /courses.json
  def index
    @filterrific = initialize_filterrific(
    Course,
    params[:filterrific],
    select_options: {
        sorted_by: Course.options_for_sorted_by,
        with_session: Course.uniq.pluck(:session)
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by,
        :search_query,
        :with_session ],
    ) or return

    @courses = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
    respond_to do |format|
      format.html # record.html.erb
      format.js {}
      format.json { render json: @courses }
      format.xlsx
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @course_type=@course.course_type
    
    if @course_type=='Short-term Course'
      @stats = @course.shortterm_courses
    elsif @course_type=='Refresher Course'
      @stats = @course.shortterm_courses
    elsif @course_type=='Orientation Course'
      @stats = @course.orientation_courses    
    elsif @course_type=='Interaction Program'
      @stats = @course.interaction_programs
    elsif @course_type=='Principal Workshop'
      @stats = @course.principal_workshops                  
    end  

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_success_path }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
