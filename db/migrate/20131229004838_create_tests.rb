class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :device_name
      t.integer :test_run_id
      t.decimal :distance
      t.decimal :time

      t.timestamps
    end
  end
end
