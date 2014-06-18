json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first-name, :last-name, :title, :publications, :email, :phone, :twitter, :bio, :verified
  json.url contact_url(contact, format: :json)
end
