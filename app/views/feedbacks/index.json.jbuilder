json.feedbacks Feedback.all.each do |feedback|
	json.(feedback, :communication_skill, :competency_subject, :quality_lecture, :usefulness_topic)
end