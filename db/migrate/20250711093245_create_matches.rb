class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :bike, null: false, foreign_key: true
      t.string :markeplace_url
      t.integer :match_score
      t.string :marketplace
      t.integer :price
      t.string :seller
      t.string :location

      t.timestamps
    end
  end
end
