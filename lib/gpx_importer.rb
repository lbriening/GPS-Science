require 'rexml/document'

class GpxImporter

  class Point
    attr_accessor :latitude, :longitude, :time
  end

  attr_accessor :test, :document

  def initialize(test, document)
    @test, @document = test, document
  end

  def track_points
    REXML::XPath.match document, 'gpx//trkpt'
  end

  def gpx_points
    track_points.map do |track_point|
      point = Point.new
      point.latitude = track_point.attributes["lat"]
      point.longitude = track_point.attributes["lon"]
      point.time = track_point.elements["time"].text
      point
    end
  end

  def import
    previous_point = nil
    gpx_points.each do |p|
      next_point = test.points.create latitude: p.latitude,
                                      longitude: p.longitude,
                                      time_recorded: p.time,
                                      previous_point_id: previous_point && previous_point.id
      if previous_point
        previous_point.update next_point_id: next_point.id
      end
      previous_point = next_point
    end
    test.update_distance
    test.update_time
  end

end
