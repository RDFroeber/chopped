class AddColumnRoundChoppedIdOnChefs < ActiveRecord::Migration
  def change
    add_reference :chefs, :round_chopped, index: true
    
    #Adding a Foreign Key constraint for round_chopped_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE chefs
          ADD CONSTRAINT fk_rounds
          FOREIGN KEY (round_chopped_id)
          REFERENCES rounds(id)
        SQL
        #End of SQL string
      end
    end
  end
end
