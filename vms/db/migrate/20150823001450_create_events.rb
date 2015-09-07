class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :abbv
      t.time :open_time
      t.integer :duration
      t.integer :default_location
      t.references :calendar
      t.text :schedule_yaml

      t.timestamps
    end
  end
end
