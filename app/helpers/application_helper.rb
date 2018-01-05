module ApplicationHelper
  NEWSROOM_MENU = [
    {label: "News & Stories", link: "https://blogs.chapman.edu/news-and-stories"},
    {label: "Magazine", link: ""},
    {label: "Blogs", link: ""},
    {label: "Press Releases", link: ""},
    {label: "Media Clips", link: ""},
    {label: "Excerpts", link: ""}
  ]

  def render_global_nav
    html = ""
    NEWSROOM_MENU.each do |list_item|
      html += list_item_html(list_item, "primary-link")
    end

    #put all list items inside ul tag
    html = content_tag(:ul, :class => "global-nav-links") do
      html.html_safe
    end
  end

  def render_footer_menu
    html = ""
    NEWSROOM_MENU.each do |list_item|
      html += list_item_html(list_item, "")
    end

    # Footer has one additional link not in global nav
    contact_us = {label: "Contact Us", link: ""}
    html += list_item_html(contact_us, "")

    # Put all list items inside ul tag
    html = content_tag(:ul, :class => "menu-list") do
      html.html_safe
    end
  end

  def list_item_html(list_item, class_name)
    html = content_tag :li, :class => class_name do
      primary_link_html(list_item)
    end
  end

  def primary_link_html(list_item)
    html = link_to list_item[:label], list_item[:link]
  end
end
