json.array!(@questions) do |question|
  json.extract! question, :id, :name, :question
  json.url question_url(question, format: :json)
end
