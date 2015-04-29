class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :lead
      t.integer :training, default: 0
      t.integer :shadowing, default: 3
      t.text :desc

      t.timestamps
    end
  end
end
