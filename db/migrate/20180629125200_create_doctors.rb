class CreateDoctors < ActiveRecord::Migration[5.1]
  def self.up
    create_table :doctors do |t|
      t.integer :group_id
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end

  # execute 'ALTER TABLE doctors ADD PRIMARY KEY (doctor_id);'

  def self.down
    drop_table :doctors
  end
end
