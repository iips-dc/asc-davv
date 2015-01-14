class AdminController < ApplicationController
	before_filter :authenticate_admin!
	layout "adminDashboard"
	def index
		@user = current_admin
	end
end
