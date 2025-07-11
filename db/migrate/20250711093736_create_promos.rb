class CreatePromos < ActiveRecord::Migration[7.1]
  def change
    create_table :promos do |t|
      t.string :name
      t.string :description
      t.string :promocode
      t.string :website_url

      t.timestamps
    end
  end
end
