class Collection < ActiveRecord::Base
	has_many :collectionphotographs
	has_many :photographs, through: :collectionphotographs
end
