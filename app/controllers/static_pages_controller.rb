class StaticPagesController < ApplicationController
	respond_to :html

	def index
		@notices=Notice.all
		@downloads=Schedule.all
		respond_with(@notices, @downloads)
	end	

	def programs
		@courses = Course.all
		respond_with(@courses)
	end	
end
