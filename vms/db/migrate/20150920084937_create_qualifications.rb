class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.references :user, index: true
      t.references :position, index: true
      t.string :status
      t.integer :count

      t.timestamps
    end
  end
end
