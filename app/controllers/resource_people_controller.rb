class ResourcePeopleController < ApplicationController
  before_filter :set_resource_person, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  layout "adminDashboard"

  respond_to :html

  def index
    @resource_people = Kaminari.paginate_array(ResourcePerson.all).page(params[:page]).per(4)
    respond_with(@resource_people)
  end

  def show
    respond_with(@resource_person)
  end

  def new
    @resource_person = ResourcePerson.new
    respond_with(@resource_person)
  end

  def edit
  end

  def create
    @resource_person = ResourcePerson.new(params[:resource_person])
    
    respond_with(@resource_person)
    respond_to do |format|
      if @resource_person.save
        format.html { redirect_to courses_success_path }
        format.json { render json: @resource_person, status: :created, location: @resource_person }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @resource_person.update_attributes(params[:resource_person])
    respond_with(@resource_person)
  end

  def destroy
    @resource_person.destroy
    respond_with(@resource_person)
  end

  private
    def set_resource_person
      @resource_person = ResourcePerson.find(params[:id])
    end
end
