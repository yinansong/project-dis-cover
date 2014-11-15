json.array!(@manholecovers) do |manholecover|
  json.extract! manholecover, :id
  json.url manholecover_url(manholecover, format: :json)
end
