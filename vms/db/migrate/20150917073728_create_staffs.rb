class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :event, index: true
      t.references :position, index: true
      t.references :shift, index: true
      t.integer :permanent_user

      t.timestamps
    end
  end
end
