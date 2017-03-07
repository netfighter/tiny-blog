module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, '&times'.html_safe, class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def admin?
    current_user && current_user.role?('admin')
  end

  def ability_to_array(a)
    a.send(:rules).collect do |rule|
      rule.instance_eval do
        {
          :base_behavior => @base_behavior,
          :subjects => @subjects.map(&:to_s),
          :actions => @actions.map(&:to_s),
          :conditions => @conditions
        }
      end
    end
  end

  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
