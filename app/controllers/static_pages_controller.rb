class StaticPagesController < ApplicationController
	before_filter :authenticate_admin!, :only => [:dd_result,:dd_search]
	load_and_authorize_resource :class => false, :only => [:dd_result,:dd_search]
	respond_to :html

	def index
		@notices=Notice.all
		@downloads=Schedule.all
		@courses = Course.order(:start_date)
		@quote=Quoth.get
		respond_with(@notices, @downloads, @courses, @quote)
	end		

	def programs
		@courses = Course.order(:start_date)
		respond_with(@courses)
	end	

	def dd_search
		respond_to do |format|
			format.html { render "/static_pages/dd_search", :layout => "adminDashboard"}
		end	
	end	

	def dd_result
		@receipt_date=Date.parse(params[:receipt_date].to_s).strftime('%d-%b-%Y')
		@course_type=params[:course_type]
		@certificate_amt=params[:certificate][0].to_i
		@others=params[:others][0].to_i
		
		if @course_type == 'Short-term Course'
			@record=ShorttermCourse.find_by_id(params[:registration_id])
		elsif @course_type == 'Refresher Course'
			@record=RefresherCourse.find_by_id(params[:registration_id])
		elsif @course_type == 'Orientation Course'
			@record=OrientationCourse.find_by_id(params[:registration_id])
		elsif @course_type == 'Interaction Program'
			@record=InteractionProgram.find_by_id(params[:registration_id])
		elsif @course_type == 'Principal Workshop'
			@record=PrincipalWorkshop.find_by_id(params[:registration_id])
		end

		if @record.nil?
			respond_to do |format|
				format.html { redirect_to "/dd_search", notice: 'No Record Found'}
			end	
		else	
			respond_to do |format|
				format.html { render "/static_pages/dd_result", :layout => "receipt"}
			end		
		end	
	end

	def result
		date=Date.parse(params[:dob].to_s).strftime('%Y-%m-%d')
		@course_type=params[:course_type]
		if @course_type == 'Short-term Course'
			@record=ShorttermCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif @course_type == 'Refresher Course'
			@record=RefresherCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif @course_type == 'Orientation Course'
			@record=OrientationCourse.find_by_dob_and_id(date, params[:registration_id])
		elsif @course_type == 'Interaction Program'
			@record=InteractionProgram.find_by_dob_and_id(date, params[:registration_id])
		elsif @course_type == 'Principal Workshop'
			@record=PrincipalWorkshop.find_by_dob_and_id(date, params[:registration_id])	
		end

		if @record.nil?
			respond_to do |format|
				format.html { redirect_to "/search", notice: 'No Record Found'}
			end	
		else	
			respond_to do |format|
				format.html { render "/static_pages/result", :layout => "receipt"}
			end		
		end	
	end
end
