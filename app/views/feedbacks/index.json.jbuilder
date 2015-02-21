json.feedbacks Feedback.all.each do |feedback|
	json.(feedback, :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic)
	json.resource_people do |json|
		json.(feedback.resource_person , :person_name)
	end	
	json.course do |json|
		json.(feedback.course , :course_name)
	end	
end