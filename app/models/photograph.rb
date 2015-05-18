class Photograph < ActiveRecord::Base
	has_many :collectionphotographs
	has_many :collections, :through => :collectionphotographs
	has_one :category
end
