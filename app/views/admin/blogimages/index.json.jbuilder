json.array!(@blogimages) do |blogimage|
  json.extract! blogimage, :id, :title, :caption, :preview_color
  json.url blogimage_url(blogimage, format: :json)
end
