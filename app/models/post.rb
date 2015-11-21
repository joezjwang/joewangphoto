class Post < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]
  	validates :title, :presence => true

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	def word_count
		body.scan(/[[:alpha:]]+/).count
	end

	def reading_time
		#count words.convert to float and divide by 275 plus number of photos*0.1(6seconds) and round the end result
		minutes=((word_count.to_f/250)+(photo_count*0.1)).round
		if minutes >= 1
			minutes
		else
			1
		end
	end
	def photo_count
		3
		#count number of photos associated with post. Count in database relation or in body?
	end

	#Ideally this function should be based on number of words and cut off at the end of sentences
	def body_preview (number_of_sentences)
		body.split(/\.\s+/, number_of_sentences+1)[0...number_of_sentences].join(' ').concat('...')
	end
	def body_preview_admin
		body_preview(4)
	end
	def body_preview_pc
		#should count the number of words and reduce the sentence count if it is too long
		body_preview(4)
	end
	def body_preview_mobile
		#should count the number of words and reduce the sentence count if it is too long
		body_preview(2)
	end
end
