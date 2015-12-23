class AddDateTakenToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :date_taken, :datetime
  end
end
