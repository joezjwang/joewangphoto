module ApplicationHelper

  #For SEO, displaying header meta data based on page specific content
  #og_ is for facebook Open Graph
  #To use this simply call these methods in the views
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

  def og_type(text)
    content_for :og_type, text
  end

  def uptime
    time_ago_in_words(Joewangphotography::BOOTED_AT)
  end
  	
  def markdown(text)

    renderer = CustomMardownRenders.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      lax_html_blocks: true,
      superscript:        true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true,
      strikethrough: true
  }

    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end

class CustomMardownRenders < Redcarpet::Render::HTML
  include ActionView::Helpers::AssetTagHelper

  #Apply pygments gem to the highlighting of codeblocks in Markdown
  def block_code(code, language)
    Pygments.highlight(code, lexer:language)
  end
  
  #Overrides redcarpet Markdown image render with custom method
  #This allows display of caption and encapulation in <figure> tage
  def image(link_or_id, style_and_css_or_alt, title)  
    if link_or_id.to_i > 0
      args = style_and_css_or_alt.split("|")
      style = args[0].to_sym
      css = args[1] 
      # .find_by here b'cause it won't raise ActiveRecord::RecordNotFound
      # if none found - no image output
      if img = Blogimage.find_by(id: link_or_id)
        #alt text is img.title, caption is img.caption
        if img.caption.present?
          "<figure><img src='#{img.image.url(style)}' alt=\"#{img.title}\"><br/><figcaption>#{img.caption}</figcaption></figure>"
        else
          "<figure><img src='#{img.image.url(style)}' alt=\"#{img.title}\"><br/></figure>"  
        end
      else
        ''
      end
    else
      # just do it like Redcarpet::Render::HTML would do
      # so we can still use default image markdown
      image_tag(link_or_id, title: title, alt: style_and_css_or_alt)
    end
  end
  #Below section can be used for searching through markdown for custom markup
  def postprocess(full_document)
    full_document.gsub(/\[youtube (.*)\]/) do
        "<div class=\"youtube-content\"><iframe class=\"youtube-video\" src=\"https://www.youtube.com/embed/#{$1}?rel=0&amp\" frameborder=\"0\" allowfullscreen></iframe></div>"
    end
  end
end
