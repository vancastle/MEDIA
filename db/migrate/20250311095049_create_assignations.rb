class CreateAssignations < ActiveRecord::Migration[7.1]
  def change
    create_table :assignations do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :diagnostic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
