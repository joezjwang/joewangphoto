class Photograph < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  has_many :collectionphotographs
  has_many :collections, through: :collectionphotographs
  has_one :category

  validates :title, :presence => true
  before_destroy :find_remove_cover

  has_attached_file :photo, :styles => {:original => "1600x1600>", :thumb => "320x320>#", :pc_large => "x720", :pc_small => "x480", :mobile_large => "480x"}, :convert_options => { :thumb => '-quality 80 -interlace Plane', :pc_large => '-quality 85 -interlace Plane', :pc_small => '-quality 85 -interlace Plane', :mobile_large => '-quality 80 -interlace Plane'},  :default_url => "/missing.png"
  validates_attachment_content_type :photo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/
  validates_attachment_size :photo, :less_than => 10.megabytes


  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  # Remove cover id attached to collection if cover photo is deleted
  def find_remove_cover
    @collections=Collection.where({cover_photograph_id: id})
    unless @collections.blank?
      @collections.each do |collection|
        @updating_collection = Collection.find(collection.id)
        @updating_collection.update_attribute(:cover_photograph_id,nil)
      end
    end
  end
end
