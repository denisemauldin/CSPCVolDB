class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :staff, index: true
      t.references :offer, index: true
      t.references :location, index: true
      t.datetime :date
      t.timestamps
    end
  end
end
