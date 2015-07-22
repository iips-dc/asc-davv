class PrincipalWorkshopsController < ApplicationController
  before_filter :set_principal_workshop, only: [:show, :edit, :update, :destroy, :registered]
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record] 
  load_and_authorize_resource :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  respond_to :html, :js, :json, :xlsx

  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  def show
    respond_with(@principal_workshop)
  end

  def registered
    respond_with(@principal_workshop)
  end

  def record
    @filterrific = initialize_filterrific(
    PrincipalWorkshop,
    params[:filterrific],
    select_options: {
        sorted_by: PrincipalWorkshop.options_for_sorted_by,
        with_course_name: Course.where("LOWER(course_type)='principal workshop'").pluck(:course_name)
    },
    persistence_id: 'shared_key',
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [ 
        :sorted_by,
        :search_query,
        :with_course_name ],
    ) or return

    @principal_workshops = Kaminari.paginate_array(@filterrific.find).page(params[:page]).per(25)
  end

  def new
    @principal_workshop = PrincipalWorkshop.new
    respond_with(@principal_workshop)
  end

  def edit
  end

  def create
    @principal_workshop = PrincipalWorkshop.new(params[:principal_workshop])
    
    respond_to do |format|
      if @principal_workshop.save
        format.html { redirect_to "/workshop_registered/#{@principal_workshop.id}" }
        format.json { render json: @principal_workshop, status: :created, location: @principal_workshop }
      else
        format.html { render action: "new" }
        format.json { render json: @principal_workshop.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @principal_workshop.update_attributes(params[:principal_workshop])
    respond_with(@principal_workshop)
  end

  def destroy
    @principal_workshop.destroy
    respond_with(@principal_workshop)
  end

  private
    def set_principal_workshop
      @principal_workshop = PrincipalWorkshop.find(params[:id])
    end
end
