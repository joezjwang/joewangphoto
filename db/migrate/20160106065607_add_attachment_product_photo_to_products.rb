class AddAttachmentProductPhotoToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :product_photo
    end
  end

  def self.down
    remove_attachment :products, :product_photo
  end
end
