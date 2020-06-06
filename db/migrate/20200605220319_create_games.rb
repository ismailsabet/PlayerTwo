class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :user, null: false
      t.bigint :appid, null: false
      t.string :name, null: false
      t.bigint :playtime, null: false
      t.boolean :recent, default: false
      t.string :img_url, null: false
      t.timestamps
    end
  end
end
