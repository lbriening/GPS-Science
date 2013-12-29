class TestRun < ActiveRecord::Base

  belongs_to :day
  has_many :tests

end
