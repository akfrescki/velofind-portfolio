class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :brand
      t.string :model
      t.string :color
      t.string :frame_number
      t.string :marketplace
      t.string :marketplace_url
      t.string :price
      t.string :seller
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end
