class AddBikeBrandAndFrameNumberToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :bike_brand, :string
    add_column :orders, :frame_number, :string
  end
end
