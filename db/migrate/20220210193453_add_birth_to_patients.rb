class AddBirthToPatients < ActiveRecord::Migration[7.0]
  def change
	add_column :patients, :birth, :date
  end
end
