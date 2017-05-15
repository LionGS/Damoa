class CreateTotalposts < ActiveRecord::Migration[5.0]
  def change
    create_table "totalposts", primary_key: "post_no", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.text    "source",         limit: 65535
      t.text    "post_attribute", limit: 65535
      t.text    "title",          limit: 65535
      t.text    "link",           limit: 65535
      t.text    "mydate",         limit: 65535
      t.integer "hits"
      t.integer "recommened"
      t.text    "last_update",    limit: 65535
      t.integer "popurarity"
      t.text    "posttext",       limit: 65535
    end
  end
end
