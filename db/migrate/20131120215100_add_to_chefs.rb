class AddToChefs < ActiveRecord::Migration
  def change
    add_reference :chefs, :episode, null: false, index: true
    add_reference :chefs, :round_chopped, null: false, index: true
    
    #Adding a Foreign Key constraint for episode_id and round_chopped_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE chefs
          ADD CONSTRAINT fk_episodes
          FOREIGN KEY (episode_id)
          REFERENCES episodes(id),
          ADD CONSTRAINT fk_rounds
          FOREIGN KEY (round_chopped_id)
          REFERENCES rounds(id)
        SQL
        #End of SQL string
      end
    end
  end
end
