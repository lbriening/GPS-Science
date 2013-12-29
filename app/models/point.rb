class Point < ActiveRecord::Base

  belongs_to :test
  belongs_to :previous_point, foreign_key: :previous_point_id, class_name: 'Point'
  belongs_to :next_point, foreign_key: :next_point_id, class_name: 'Point'

  RADIUS = 6371

  def time
    if previous_point
      time_recorded - previous_point.time_recorded
    else
      0
    end
  end

  def distance
    if previous_point
      distance_between previous_point, self
    else
      0
    end
  end

  def distance_between(p1, p2)
    difference_latitude = radians(p1.latitude) - radians(p2.latitude)
    difference_longitude = radians(p1.longitude) - radians(p2.longitude)

    a = Math.sin(difference_latitude/2) *
          Math.sin(difference_latitude/2) +
          Math.cos(radians(p1.latitude)) *
          Math.cos(radians(p2.latitude)) * Math.sin(difference_longitude/2) *
          Math.sin(difference_longitude/2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = RADIUS * c
    d
  end

  def radians(n)
    n * Math::PI/180.0
  end
end
