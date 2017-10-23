class AddRecommendUpdateDateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :recommend_update_date, :datetime
  end
end
