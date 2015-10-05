class AddUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :urlgit, :string, limit: 100, null: false
    add_column :articles, :urlweb, :string, limit: 100, null: false
    add_column :articles, :urlimg, :string, limit: 100, null: false
    add_attachment :articles, :image
  end
end
