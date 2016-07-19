module ApplicationHelper
  def page_title(prefix_title = '')
    base_title = "I'm Deri"
    if prefix_title.empty?
      base_title
    else
      prefix_title +  " | " + base_title
    end
  end
end
