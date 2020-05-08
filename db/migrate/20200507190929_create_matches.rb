class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user_1, null: false
      t.integer :user_2, null: false
      t.boolean :user_1_approves
      t.boolean :user_2_approves
      t.timestamps
    end
  end
end
