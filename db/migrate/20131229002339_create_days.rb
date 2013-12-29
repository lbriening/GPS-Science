class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :weather_condition
      t.decimal :temperature
      t.date :test_date
      t.decimal :pressure

      t.timestamps
    end
  end
end
