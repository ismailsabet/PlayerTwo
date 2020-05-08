class RenameMatches < ActiveRecord::Migration[6.0]
  def change
    rename_column :matches, :user_1_id, :user_1
  end
end
