class StaticPagesController < ApplicationController
	respond_to :html

	def index
		@notices=Notice.all
		@downloads=Schedule.all
		@courses = Course.order(:start_date)
		respond_with(@notices, @downloads, @courses)
	end		

	def programs
		@courses = Course.order(:start_date)
		respond_with(@courses)
	end	

	def result
		date=Date.parse(params[:dob].to_s).strftime('%Y-%m-%d')
		if params[:course_type] == 'Short-term Course'
			@record=ShorttermCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif params[:course_type] == 'Refresher Course'
			@record=RefresherCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif params[:course_type] == 'Orientation Course'
			@record=OrientationCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif params[:course_type] == 'Interaction Program'
			@record=InteractionProgram.find_by_dob_and_id(date, params[:registration_id])
		end

		if @record.nil?
			respond_to do |format|
				format.html { redirect_to "/search", notice: 'No Record Found'}
			end	
		else	
			respond_to do |format|
				format.html { render "/static_pages/result", :layout => false}
			end		
		end	
	end
end
