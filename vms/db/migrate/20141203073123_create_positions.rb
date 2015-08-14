class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :training, default: 0
      t.integer :shadowing, default: 3
      t.text :desc

      t.timestamps
    end
  end
end
