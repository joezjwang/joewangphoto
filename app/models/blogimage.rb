class Blogimage < ActiveRecord::Base
	belongs_to :post
	has_attached_file :image, :styles => {:original => "1600x1600>",  :pc_large => "x720", :pc_small => "x480", :mobile_large => "480x"}, :convert_options => { :pc_large => '-quality 80 -interlace Plane', :pc_small => '-quality 75 -interlace Plane', :mobile_large => '-quality 75 -interlace Plane'},  :default_url => "/missing.png"
	validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/
	validates_attachment_size :image, :less_than => 10.megabytes

	before_create :default_name
	before_destroy :find_remove_cover

    def default_name
    	self.title ||= File.basename(image_file_name, '.*').titleize if image
  	end

  	def find_remove_cover
    	@posts=Post.where({cover_blogimage_id: id})
    	unless @posts.blank?
      	@posts.each do |post|
        	@updating_post = Post.find(post.id)
        	@updating_post.update_attribute(:cover_blogimage_id,nil)
      	end
    end
  end
end
