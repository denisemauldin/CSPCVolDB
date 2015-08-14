class AddUserPositions < ActiveRecord::Migration
  def change
    create_join_table :positions, :users do |t|
      t.index :position_id
      t.index :user_id
      t.integer :approved_by_id
      
      t.timestamps
    end
  end
end
