class UpdatePatientTable < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :date_of_birth, :date
    add_column :patients, :gender, :string
    add_column :patients, :phone_number, :string
  end
end
