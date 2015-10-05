class CreateCategoriesProjects < ActiveRecord::Migration
  def change
    create_table :categories_projects do |t|
      t.references :category, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
    end
  end
end
