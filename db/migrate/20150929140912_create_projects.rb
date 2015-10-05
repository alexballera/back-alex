class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, limit: 50, null: false
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end