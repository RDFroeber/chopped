class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :judge, null: false, index: true
      t.references :dish, null: false, index: true
    end
    #Adding a Foreign Key constraint for judge_id and dish_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE scores
          ADD CONSTRAINT fk_judges
          FOREIGN KEY (judge_id)
          REFERENCES judges(id),
          ADD CONSTRAINT fk_dishes
          FOREIGN KEY (dish_id)
          REFERENCES dishes(id)
        SQL
        #End of SQL string
      end
    end
  end
end
