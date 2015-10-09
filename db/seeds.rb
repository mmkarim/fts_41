3.times do |n|
  title = "Subject #{n+1}"
  duration = 10
  Subject.create(title: title, duration: duration)
end

subjects = Subject.order(:created_at).take(9)
3.times do |n|
  content = "Question #{n+1}"
  subjects.each {|subject| subject.questions.create!(content: content,status: 1)}
end

questions = Question.all
questions.each {|question| question.answers.create!(content: "Option 0", correct: true)}
3.times do |n|
  content = "Option #{n+1}"
  questions.each {|question| question.answers.create!(content: content)}
end
