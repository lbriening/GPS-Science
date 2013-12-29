class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :time_recorded
      t.integer :test_id
      t.integer :previous_point_id
      t.integer :next_point_id

      t.timestamps
    end
  end
end
