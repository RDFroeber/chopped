class DropWinnerIdColumnInEpisodes < ActiveRecord::Migration
  def change
    remove_column :episodes, :winner_id
  end
end
