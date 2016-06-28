module ApplicationHelper
  def full_title(page_title)
    base_title = 'RobertScott'
    if page_title.empty?
      base_title + ' | Entertaining Short Videos'
    else
      page_title + ' | ' + base_title
    end
  end

  def markdown(text)
    html = Redcarpet::Render::HTML.new(prettify: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(html, space_after_headers: true, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end

  def generate_form_errors(errors)
    content_tag(:div, class: 'error') do
      'Oops. Something went wrong:'.html_safe +
      content_tag(:ul) do
        errors.full_messages.map { |message| content_tag(:li, message.gsub(/(Last|First)/, 'Full')) }.uniq.join.html_safe
      end
    end
  end

  def video_url(video_id)
    "https://www.youtube.com/watch?v=#{video_id}"
  end

  def subscribe_url
    'https://www.youtube.com/channel/UC34xp0_WvobosrCJeBTlmYg?sub_confirmation=1'
  end

  def subscribe_button(text = 'Subscribe')
    link_to icon('youtube-play', "#{text}"), subscribe_url, 
    class: 'waves-effect waves-light btn red white-text', target: '_blank'
  end

  def icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end
end
