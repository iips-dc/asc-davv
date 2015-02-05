class RegistrationController < Devise::RegistrationsController	

	def new
		render :nothing => true
		@admin = Admin.new
	end	

	def create
		#@admin = Admin.new
		#@admin.username = params[:admin][:username]
		#@admin.email = params[:admin][:email]
		#@admin.password = params[:admin][:password]
		#@admin.password_confirmation =params[:admin][:password_confirmation]

		#@admin.valid?
		#if @admin.errors.blank?
		#	@admin.save
		#	redirect_to welcome_path
		#else
		#	render :action => "new"
		#end		
	end	

	def edit
		render layout: "adminDashboard"
	end	
end
