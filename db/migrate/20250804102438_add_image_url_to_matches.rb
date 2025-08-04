class AddImageUrlToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :image_url, :string
  end
end
