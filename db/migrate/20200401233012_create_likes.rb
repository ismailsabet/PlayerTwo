class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.integer :liked_user_id, null: false
      t.timestamps
    end
  end
end
