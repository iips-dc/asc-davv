json.array!(Feedback.select("sum(communication_skill) as communication_skill,sum(competency_subject) as competency_subject,sum(quality_lecture) as quality_lecture,sum(usefulness_topic) as usefulness_topic, resource_person_id,course_id").group(:resource_person_id, :course_id)) do |feedback|
	json.extract! feedback.resource_person, :person_name
	json.extract! feedback.course, :course_name
	json.extract! feedback, :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic
end