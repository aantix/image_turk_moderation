json.array!(@images) do |image|
  json.extract! image, :name, :description, :image_path
  json.url image_url(image, format: :json)
end
