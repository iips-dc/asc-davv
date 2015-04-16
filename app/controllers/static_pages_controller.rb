class StaticPagesController < ApplicationController
	respond_to :html

	def index
		@notices=Notice.all
		respond_with(@notices)
	end	

	def programs
		@courses = Course.all
		respond_with(@courses)
	end	
end
