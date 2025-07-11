class AddMatchIdToReport < ActiveRecord::Migration[7.1]
  def change
    add_reference :reports, :match, null: false, foreign_key: true
  end
end
