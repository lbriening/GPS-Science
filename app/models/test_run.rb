class TestRun < ActiveRecord::Base

  belongs_to :day
  has_many :tests

  def name
    [day && day.test_date, speed].join(" - ")
  end

end
