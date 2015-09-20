class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :start
      t.string :duration

      t.timestamps
    end
  end
end
