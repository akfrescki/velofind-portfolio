class AddColorToBikes < ActiveRecord::Migration[7.1]
  def change
    add_column :bikes, :color, :string
  end
end
