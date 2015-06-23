class AdminController < ApplicationController
	before_filter :authenticate_admin!
	layout "adminDashboard"
	def index
		@user = current_admin
		@courses = Course.count
		@resource_people = ResourcePerson.count
		@shortterm_course= ShorttermCourse.count
		@refresher_course= RefresherCourse.count
		@orientation_course= OrientationCourse.count
		@interaction_program= InteractionProgram.count
		@notices = Notice.all
		@downloads=Schedule.all 
	end
end
