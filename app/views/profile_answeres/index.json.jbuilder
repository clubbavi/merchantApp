json.array!(@profile_answeres) do |profile_answere|
  json.extract! profile_answere, :id, :profile_id, :question_id, :answere
  json.url profile_answere_url(profile_answere, format: :json)
end
