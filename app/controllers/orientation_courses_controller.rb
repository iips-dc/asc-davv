class OrientationCoursesController < ApplicationController
  before_filter :set_orientation_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
    respond_with(@orientation_course)
  end

  def new
    @orientation_course = OrientationCourse.new
    respond_with(@orientation_course)
  end

  def edit
  end

  def create
    @orientation_course = OrientationCourse.new(params[:orientation_course])
    @orientation_course.save
    respond_with(@orientation_course)
  end

  def update
    @orientation_course.update_attributes(params[:orientation_course])
    respond_with(@orientation_course)
  end

  def destroy
    @orientation_course.destroy
    respond_with(@orientation_course)
  end

  private
    def set_orientation_course
      @orientation_course = OrientationCourse.find(params[:id])
    end
end
