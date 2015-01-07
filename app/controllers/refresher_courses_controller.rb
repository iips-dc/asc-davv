class RefresherCoursesController < ApplicationController
  # GET /refresher_courses
  # GET /refresher_courses.json
  
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @refresher_courses }
    end
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
        format.html { redirect_to @refresher_course, notice: 'Refresher course was successfully created.' }
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
      format.html { redirect_to refresher_courses_url }
      format.json { head :no_content }
    end
  end
end
