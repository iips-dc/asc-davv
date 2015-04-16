class ResourcePeopleController < ApplicationController
  before_filter :set_resource_person, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  load_and_authorize_resource 
  layout "adminDashboard"

  respond_to :html, :except => :index

  def index
    @filterrific = initialize_filterrific(
    ResourcePerson,
    params[:filterrific],
    select_options: {
        sorted_by: ResourcePerson.options_for_sorted_by
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by,
        :search_query ],
    ) or return

    @resource_people = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
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
