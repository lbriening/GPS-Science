class AddStdDevToTestRun < ActiveRecord::Migration
  def change
	add_column "test_runs", "standard_deviation", :decimal
  end
end
