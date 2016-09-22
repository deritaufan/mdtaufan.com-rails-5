module ApplicationHelper
  def page_title(prefix_title = '')
    base_title = "I'm Deri"
    if prefix_title.empty?
      base_title
    else
      prefix_title +  " | " + base_title
    end
  end

  def render_header(admin_page = '')
  	if admin_page.eql? "admin"
  		render "shared/header_admin"
  	else
  		render "shared/header"
  	end
  end
end
