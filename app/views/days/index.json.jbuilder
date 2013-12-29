json.array!(@days) do |day|
  json.extract! day, :id, :weather_condition, :temperature, :test_date, :pressure
  json.url day_url(day, format: :json)
end
