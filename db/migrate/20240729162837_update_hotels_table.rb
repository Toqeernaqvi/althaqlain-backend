class UpdateHotelsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :hotels, :facilities, :json
    rename_column :hotels, :paragraphs, :description
    change_column :hotels, :description, :string
  end
end
