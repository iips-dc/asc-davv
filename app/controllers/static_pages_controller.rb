class StaticPagesController < ApplicationController
	before_filter :authenticate_admin!, :only => [:download]

	layout "adminDashboard", :only => [:download]
	respond_to :html

	def index
		@notices=Notice.all
		@downloads=Schedule.all
		respond_with(@notices, @downloads)
	end	

	def download
		@courses = Course.all
		respond_with(@courses)
	end	

	def programs
		@courses = Course.all
		respond_with(@courses)
	end	

	def result
		if params[:course_type] == 'Short-term Course'
			@record=ShorttermCourse.find_by_dob_and_id(params[:dob], params[:registration_id])
		elsif params[:course_type] == 'Refresher Course'
			@record=RefresherCourse.find_by_dob_and_id(params[:dob], params[:registration_id])
		elsif params[:course_type] == 'Orientation Course'
			@record=OrientationCourse.find_by_dob_and_id(params[:dob], params[:registration_id])
		elsif params[:course_type] == 'Interaction Program'
			@record=InteractionProgram.find_by_dob_and_id(params[:dob], params[:registration_id])
		end
		respond_to do |format|
			format.html { render "static_pages/result", :layout => false}
		end			
	end
end
