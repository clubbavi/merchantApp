json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :email, :category_id, :product_id, :section_id, :question_id
  json.url profile_url(profile, format: :json)
end
