class DropColumnRoundChoppedIdOnChefs < ActiveRecord::Migration
  def change
    remove_column :chefs, :round_chopped_id
  end
end
