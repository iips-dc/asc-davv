class RegistrationController < Devise::RegistrationsController	
	layout "adminDashboard", :only => [:edit, :update, :destroy]
	def new
		raise ActionController::RoutingError.new('Not Found')
	end	

	def create
		@admin = Admin.new
		@admin.username = params[:admin][:username]
		@admin.email = params[:admin][:email]
		@admin.password = params[:admin][:password]
		@admin.password_confirmation =params[:admin][:password_confirmation]
		@admin.role = params[:admin][:role]

		@admin.valid?
		if @admin.errors.blank?
			@admin.save
			redirect_to welcome_path
		else
			render :action => "new"
		end		
	end
end
