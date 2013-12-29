class Day < ActiveRecord::Base

  has_many :test_runs
  has_many :tests, through: :test_runs

end
