class RegistrationController < Devise::RegistrationsController

	def new
		@admin = Admin.new
	end	

	def create
		@admin = Admin.new
		@admin.username = params[:admin][:username]
		@admin.email = params[:admin][:email]
		@admin.password = params[:admin][:password]
		@admin.password_confirmation =params[:admin][:password_confirmation]

		@admin.valid?
		if @admin.errors.blank?
			@admin.save
			redirect_to admin_index_path
		else
			render :action => "new"
		end		
	end	
end
