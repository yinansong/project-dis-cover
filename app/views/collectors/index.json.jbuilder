json.array!(@collectors) do |collector|
  json.extract! collector, :id
  json.url collector_url(collector, format: :json)
end
