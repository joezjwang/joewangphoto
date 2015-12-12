class CreateBlogimages < ActiveRecord::Migration
  def change
    create_table :blogimages do |t|
      t.string :title
      t.text :caption
      t.string :preview_color

      t.timestamps null: false
    end
  end
end
