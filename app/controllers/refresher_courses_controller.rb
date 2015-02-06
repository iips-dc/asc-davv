class RefresherCoursesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  # GET /refresher_courses
  # GET /refresher_courses.json
  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /refresher_courses/1
  # GET /refresher_courses/1.json
  def show
    @refresher_course = RefresherCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @refresher_course }
    end
  end

  def record
    @refresher_courses = Kaminari.paginate_array(RefresherCourse.all).page(params[:page]).per(4)

    respond_to do |format|
      format.html 
      format.json { render json: @refresher_courses }
    end
  end

  # GET /refresher_courses/new
  # GET /refresher_courses/new.json
  def new
    @refresher_course = RefresherCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @refresher_course }
    end
  end

  # GET /refresher_courses/1/edit
  def edit
    @refresher_course = RefresherCourse.find(params[:id])
  end

  # POST /refresher_courses
  # POST /refresher_courses.json
  def create
    @refresher_course = RefresherCourse.new(params[:refresher_course])

    respond_to do |format|
      if @refresher_course.save
        format.html { redirect_to registered_path }
        format.json { render json: @refresher_course, status: :created, location: @refresher_course }
      else
        format.html { render action: "new" }
        format.json { render json: @refresher_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /refresher_courses/1
  # PUT /refresher_courses/1.json
  def update
    @refresher_course = RefresherCourse.find(params[:id])

    respond_to do |format|
      if @refresher_course.update_attributes(params[:refresher_course])
        format.html { redirect_to @refresher_course, notice: 'Refresher course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @refresher_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refresher_courses/1
  # DELETE /refresher_courses/1.json
  def destroy
    @refresher_course = RefresherCourse.find(params[:id])
    @refresher_course.destroy

    respond_to do |format|
      format.html { redirect_to refresher_record_path }
      format.json { head :no_content }
    end
  end
end
