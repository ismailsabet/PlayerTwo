class AddSteamConnectedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :steam_connected, :boolean, default: false
  end
end
