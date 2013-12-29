json.array!(@points) do |point|
  json.extract! point, :id, :latitude, :longitude, :time_recorded
  json.url point_url(point, format: :json)
end
