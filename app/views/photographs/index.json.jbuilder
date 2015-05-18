json.array!(@photographs) do |photograph|
  json.extract! photograph, :id, :title, :description
  json.url photograph_url(photograph, format: :json)
end
