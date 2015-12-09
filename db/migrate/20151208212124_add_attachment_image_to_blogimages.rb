class AddAttachmentImageToBlogimages < ActiveRecord::Migration
  def self.up
    change_table :blogimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :blogimages, :image
  end
end
