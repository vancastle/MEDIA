class CreateDiagnostics < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnostics do |t|
      t.text :description
      t.string :specialty
      t.boolean :selected, default: false
      t.boolean :specialist_needed, default: false
      t.references :consultation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
