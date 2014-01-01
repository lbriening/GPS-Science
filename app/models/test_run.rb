class TestRun < ActiveRecord::Base

  belongs_to :day
  has_many :tests

  def name
    [day && day.test_date, speed].join(" - ")
  end

  def update_standard_deviation
    update_attribute :standard_deviation, calculated_standard_deviation
  end

  def calculated_standard_deviation
    tests_with_data = tests.where(Test.arel_table[:distance].gt(0))
    variance = tests_with_data.inject(0){|sum,test| sum + test.deviation.abs } / (tests_with_data.count - 1)
    Math.sqrt variance
  end

  def sample_variance
      m = self.mean
      sum = self.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(self.length - 1).to_f
    end

  def udpate_average_distance
    update_attribute :average_distance, calculated_average_distance
  end

  def calculated_average_distance
  	tests_with_data = tests.where(Test.arel_table[:distance].gt(0))
  	tests_with_data.inject(0){|sum, test|  sum + test.distance } / tests_with_data.count
  end
end
