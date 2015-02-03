class StaticPagesController < ApplicationController
	respond_to :html

	def programs
		@courses = Course.all
		respond_with(@courses)
	end	
end
