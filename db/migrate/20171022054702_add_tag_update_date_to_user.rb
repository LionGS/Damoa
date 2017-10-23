class AddTagUpdateDateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tag_update_date, :datetime
  end
end
