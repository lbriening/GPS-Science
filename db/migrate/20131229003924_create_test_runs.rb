class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.string :speed
      t.integer :day_id

      t.timestamps
    end
  end
end
