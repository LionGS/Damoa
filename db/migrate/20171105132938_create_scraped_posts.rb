class CreateScrapedPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :scraped_posts do |t|
      t.belongs_to :user
      t.belongs_to :totalpost

      t.timestamps
    end
  end
end
