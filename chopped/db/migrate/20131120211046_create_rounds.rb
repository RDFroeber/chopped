class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :ingredient
    end
  end
end
