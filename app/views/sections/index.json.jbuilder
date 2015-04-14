json.array!(@sections) do |section|
  json.extract! section, :id, :name, :description
  json.url section_url(section, format: :json)
end
