class AddBaseImageToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :base_image, :string
  end
end
