class AddToJudges < ActiveRecord::Migration
  def change
    add_reference :judges, :episode, null: false, index: true
    
    #Adding a Foreign Key constraint for episode_id
    reversible do |dir|
      dir.up do
        execute <<-SQL  #Executes RAW SQL
          ALTER TABLE judges
          ADD CONSTRAINT fk_episodes
          FOREIGN KEY (episode_id)
          REFERENCES episodes(id)
        SQL
        #End of SQL string
      end
    end
  end
end
