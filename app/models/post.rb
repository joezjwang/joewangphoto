class Post < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :history]
  	validates :title, :presence => true
  	#before save is called upon during create and update using this to insert current time to
  	#published_at if user checks the publish box
  	before_save :published_at_create
  	has_many :blogimages, :dependent => :destroy

  	#callback functions

  	def published_at_create
  		if self.published?
  			self.published_at=Time.now
  		end
  	end

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	#end of callback functions

	def long_title?
		title.size>40 ? true : false
	end

	def body_word_count
		body.scan(/[[:alpha:]]+/).count
	end

	def reading_time
		#count words.convert to float and divide by 275 plus number of photos*0.1(6seconds) and round the end result
		minutes=((body_word_count.to_f/250)+(photo_count*0.1)).round
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
