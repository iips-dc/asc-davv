class OrientationCoursesController < ApplicationController
  before_filter :set_orientation_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record] 
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  respond_to :html

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
    respond_with(@orientation_course)
  end

  def record
    @orientation_courses = Kaminari.paginate_array(OrientationCourse.all).page(params[:page]).per(4)
    respond_with(@orientation_courses)
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
