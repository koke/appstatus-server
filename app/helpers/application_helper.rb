# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def app_link(label, app, store = "us")
    url = "http://itunes.apple.com/#{store}/app/#{app.name.downcase}/id#{app.app_id}?mt=8"
    link_to(label, url)
  end
end
