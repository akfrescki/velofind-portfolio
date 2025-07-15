class RemoveBikeAndContentFromReports < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reports, :bike, foreign_key: true
    remove_column :reports, :content, :string
  end
end
