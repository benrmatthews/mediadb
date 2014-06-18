json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :media-type, :category, :frequency, :readership, :address, :email, :phone, :twitter, :bio, :verified
  json.url publication_url(publication, format: :json)
end
