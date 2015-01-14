class AdminController < ApplicationController
	before_filter :authenticate_admin!
	layout "adminLayout"
	def index
		@user = current_admin
	end
end
