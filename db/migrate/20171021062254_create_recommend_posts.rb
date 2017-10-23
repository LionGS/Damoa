class CreateRecommendPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :recommend_posts do |t|
      t.belongs_to :user
      t.belongs_to :totalpost
      t.integer :point

      t.timestamps
    end
  end
end
