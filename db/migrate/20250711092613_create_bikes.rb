class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :frame_number
      t.string :model
      t.date :stolen_date
      t.string :location_lost
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.date :first_search_date

      t.timestamps
    end
  end
end
