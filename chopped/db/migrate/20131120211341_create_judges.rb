class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :name, null: false
      t.string :attitude
    end
  end
end
