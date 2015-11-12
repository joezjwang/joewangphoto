class Post < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]

  	validates :title, :presence => true

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	def reading_time
		#count words.convert to float and divide by 275 plus number of photos*0.5 and round the end result
	end
	def photo_count
		#count number of photos associated with post. Count in database relation or in body?
	end

	def body_preview_pc
		#should count the number of words and reduce the sentence count if it is too long
		body.split(/\.\s+/, 7)[0...6].join(' ').concat('...')
	end
	def body_preview_mobile
		#should count the number of words and reduce the sentence count if it is too long
		body.split(/\.\s+/, 4)[0...3].join(' ').concat('...')
	end
end
