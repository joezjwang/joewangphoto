class Collection < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
	has_many :collectionphotographs
	has_many :photographs, through: :collectionphotographs

	validates :name, :description, :presence => true

	def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
	
end
