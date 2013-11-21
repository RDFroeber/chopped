class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name, null: false
      t.string :speciality
    end
  end
end
