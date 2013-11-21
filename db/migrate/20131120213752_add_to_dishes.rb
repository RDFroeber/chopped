class AddToDishes < ActiveRecord::Migration
  def change
    add_reference :dishes, :chef, null: false, index: true
    add_reference :dishes, :round, null: false, index: true
    
    #Adding a Foreign Key constraint for chef_id and round_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE dishes
          ADD CONSTRAINT fk_chefs
          FOREIGN KEY (chef_id)
          REFERENCES chefs(id),
          ADD CONSTRAINT fk_rounds
          FOREIGN KEY (round_id)
          REFERENCES rounds(id)
        SQL
        #End of SQL string
      end
    end
  end
end
