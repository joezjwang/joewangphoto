module ApplicationHelper

    def title(text)
    content_for :title, text
  	end

  	def description(text)
    content_for :description, text
  	end

  	def og_image_url(text)
    content_for :og_image_url, text
  	end

  	def og_page_url(text)
    content_for :og_page_url, text
  	end
  	
end
