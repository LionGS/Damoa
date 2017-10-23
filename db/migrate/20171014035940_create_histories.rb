class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.belongs_to :user
      t.belongs_to :totalpost

      t.timestamps
    end
  end
end
