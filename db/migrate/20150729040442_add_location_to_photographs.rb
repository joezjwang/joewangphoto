class AddLocationToPhotographs < ActiveRecord::Migration
  def change
    add_column :photographs, :location, :string
  end
end
