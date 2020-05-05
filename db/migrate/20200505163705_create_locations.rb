class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.references :user, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :country, null: false
      t.string :postcode
      t.timestamps
    end
  end
end
