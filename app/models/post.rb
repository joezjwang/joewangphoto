class Post < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]

  	validates :title, :presence => true

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	def body_preview_pc
		#should count the number of words and reduce the sentence count if it is too long
		body.split(/\.\s+/, 8)[0...7].join(' ').concat('...')
	end
	def body_preview_mobile
		#should count the number of words and reduce the sentence count if it is too long
		body.split(/\.\s+/, 4)[0...3].join(' ').concat('...')
	end
end
