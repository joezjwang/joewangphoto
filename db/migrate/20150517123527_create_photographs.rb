class CreatePhotographs < ActiveRecord::Migration
  def change
    create_table :photographs do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
