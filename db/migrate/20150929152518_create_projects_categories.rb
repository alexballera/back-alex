class CreateProjectsCategories < ActiveRecord::Migration
  def change
    create_table :projects_categories do |t|
      t.references :project, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
