json.shortterm_courses ShorttermCourse.all.each do |shortterm_course|
	json.(shortterm_course, :category, :city, :college, :subject, :date_of_joining, :district, :dob, :email, :gender, :landline, :marital_status, :mobile, :name, :payscale, :phd, :pin, :position, :pref_date1, :pref_date2, :religion, :res_address, :state, :stream, :university, :university_pin, :std_code)
end