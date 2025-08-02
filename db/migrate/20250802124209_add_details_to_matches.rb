class AddDetailsToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :brand, :string
    add_column :matches, :model, :string
    add_column :matches, :color, :string
    add_column :matches, :frame_number, :string
  end
end
