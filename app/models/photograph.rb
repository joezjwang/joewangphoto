class Photograph < ActiveRecord::Base
	has_many :collectionphotographs
	has_many :collections, :through => :collectionphotographs
	has_one :category

	has_attached_file :photo, :styles => {:thumb => "400x400>#", :large => "1200x900", :small => "800x600"}, :convert_options => { :thumb => '-quality 60 -strip', :small => '-quality 60 -strip'},  :default_url => "/missing.png"
	validates_attachment_content_type :photo, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/
end
