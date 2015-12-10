module ApplicationHelper


    def title(text)
    content_for :title, text
  	end

  	def description(text)
    content_for :description, text
  	end
  	
  	def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = PaperclipRender.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end

class PaperclipRender < Redcarpet::Render::HTML
  include ActionView::Helpers::AssetTagHelper
    
  # my image-object here  has_attached_file: :data
  # we overwrite Redcarpet::Render::HTML#image
  #
  def image(link_or_id, style_and_css_or_alt, title)  
    if link_or_id.to_i > 0
      args = style_and_css_or_alt.split("|")
      style = args[0].to_sym
      css = args[1] 
      # .find_by here b'cause it won't raise ActiveRecord::RecordNotFound
      # if none found - no image output
      if img = Blogimage.find_by(id: link_or_id)
        #image_tag(img.image.url(style), title: title, alt: img.title, class: css)
      
        "<figure><img src='#{img.image.url(style)}' alt='#{img.title}'></figure><figurecap>#{img.caption}</figurecap>"
      else
        ''
      end
    else
      # just do it like Redcarpet::Render::HTML would do
      # so we can still use default image markdown
      image_tag(link_or_id, title: title, alt: style_and_css_or_alt)
    end
  end
  def preprocess(full_document)
    full_document.gsub(/\[figure:(.*)\]/) do
      image = Blogimage.find_by(title: $1)
      if image
        "<span>#{$1}</span>"
      else
        $1
      end 
    end
  end
end