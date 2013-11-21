class AddToEpisodes < ActiveRecord::Migration
  def change
    add_reference :episodes, :winner, null: false, index: true
    
    #Adding a Foreign Key constraint for winner_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE episodes
          ADD CONSTRAINT fk_chefs
          FOREIGN KEY (winner_id)
          REFERENCES chefs(id)
        SQL
        #End of SQL string
      end
    end
  end
end
