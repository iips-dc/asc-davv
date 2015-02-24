json.feedbacks Feedback.all.each do |feedback|
	json.(feedback, :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic)
	json.resource_people do |json|
		json.(feedback.resource_person , :person_name)
	end	
	json.course do |json|
		json.(feedback.course , :course_name)
	end	
end

json.array!(Feedback.all) do |feedback|
	json.extract! feedback, :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic
	json.extract! feedback.resource_person, :person_name
	json.extract! feedback.course, :course_name
end