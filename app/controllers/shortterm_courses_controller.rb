class ShorttermCoursesController < ApplicationController
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  # GET /shortterm_courses
  # GET /shortterm_courses.json
  def index
    @courses = Course.all
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @courses }
      end
    end  
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
    @shortterm_courses = ShorttermCourse.all
    respond_to do |format|
      format.html 
      format.json { render json: @shortterm_courses }
    end
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
        format.html { redirect_to registered_path }
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
