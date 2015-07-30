class Photograph < ActiveRecord::Base
	has_many :collectionphotographs
	has_many :collections, through: :collectionphotographs
	has_one :category
	before_destroy :find_remove_cover

	has_attached_file :photo, :styles => {:original => "1600x1600>", :thumb => "400x400>#", :large => "1200x900", :small => "800x600"}, :convert_options => { :thumb => '-quality 85 -strip', :small => '-quality 85 -strip -interlace Plane', :large => '-quality 85 -strip -interlace Plane'},  :default_url => "/missing.png"
	validates_attachment_content_type :photo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/


    def find_remove_cover
    	puts "XXX"
      @collections=Collection.where({cover_photograph_id: id})
      unless @collections.blank?
      	puts "YYY"
        @collections.each do |collection|
        	puts "ZZZ"
        	@updating_collection = Collection.find(collection.id)
      @updating_collection.update_attribute(:cover_photograph_id,nil)

        end
      end
    end
end
