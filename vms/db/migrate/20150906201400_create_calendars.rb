class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
