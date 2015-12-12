class AddPublishedAtTakenatToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :taken_at, :datetime
  end
end
