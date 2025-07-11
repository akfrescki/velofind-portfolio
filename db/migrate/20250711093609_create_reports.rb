class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.references :bike, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
