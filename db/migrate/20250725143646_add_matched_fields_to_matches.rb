class AddMatchedFieldsToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :matched_fields, :text
  end
end
