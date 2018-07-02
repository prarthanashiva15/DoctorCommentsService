class CreateSpecialties < ActiveRecord::Migration[5.1]
  def self.up
    create_table :specialties do |t|
      t.string :name
      t.timestamps
    end
  end

  # execute 'ALTER TABLE specialties ADD PRIMARY KEY (specialty_id);'

  def self.down
    drop_table :specialties
  end
end
