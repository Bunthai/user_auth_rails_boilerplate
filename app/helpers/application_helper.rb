module ApplicationHelper
  def flash_message
    result = []
    flash.each do |type, message|
      div = content_tag(:div, class: "alert alert-#{type}") do
        content_tag(:span, message.html_safe)
      end
      result << div
    end

    result.join(' ').html_safe
  end
end
