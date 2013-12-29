json.array!(@tests) do |test|
  json.extract! test, :id, :device_name, :test_run_id, :distance, :time
  json.url test_url(test, format: :json)
end
