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
end
