class Test < ActiveRecord::Base

  belongs_to :test_run
  has_many :points

  def name
    [test_run && test_run.name, device_name].join(" - ")
  end

  def update_distance
    update_attribute :distance, calculated_distance
  end

  def update_time
    update_attribute :time, calculated_time
  end

  def calculated_distance
    points.inject(0) do |sum, point|
      sum + point.distance
    end
  end

  def calculated_time
    points.last.time_recorded - points.first.time_recorded
  end

end
