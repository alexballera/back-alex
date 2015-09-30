class AddUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :urlgit, :string, limit: 100, null: false
    add_column :projects, :urlweb, :string, limit: 100, null: false
    add_column :projects, :urlimg, :string, limit: 100, null: false
    add_attachment :projects, :image
  end
end
