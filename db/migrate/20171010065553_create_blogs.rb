class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :image
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
