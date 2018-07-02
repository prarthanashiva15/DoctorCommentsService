class CreateDoctorsSpecialties < ActiveRecord::Migration[5.1]
  def self.up
    fk_opts = { foreign_key: true, index: true, null: false }

    create_table :doctors_specialties do |t|
      t.belongs_to :doctors, fk_opts
      t.belongs_to :specialties, fk_opts
    end
  end

  def self.down
    drop_table :doctors_specialties
  end
end
