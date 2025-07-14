class RenameMarkeplaceUrlToMarketplaceUrl < ActiveRecord::Migration[7.1]
  def change
    rename_column :matches, :markeplace_url, :marketplace_url
  end
end
