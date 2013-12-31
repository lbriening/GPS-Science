class AddAverageDistanceToTestRun < ActiveRecord::Migration
  def change
  	add_column "test_runs", "average_distance", :decimal
  end
end
