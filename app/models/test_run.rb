class TestRun < ActiveRecord::Base

  belongs_to :day
  has_many :tests

  def name
    [day && day.test_date, speed].join(" - ")
  end

  def udpate_average_distance
    update_attribute :average_distance, calculated_average_distance
  end

  def calculated_average_distance
  	tests_with_data = tests.where(Test.arel_table[:distance].gt(0))
  	tests_with_data.inject(0){|sum, test|  sum + test.distance } / tests_with_data.count
  end
end
