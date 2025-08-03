class ChangeMatchedFieldsToJsonInMatches < ActiveRecord::Migration[7.1]
  def change
     change_column :matches, :matched_fields, :jsonb, using: 'matched_fields::jsonb'
  end
end
