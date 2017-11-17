class AddImageSrcToTotalposts < ActiveRecord::Migration[5.0]
  def change
    add_column :totalposts, :image_src, :string
  end
end
