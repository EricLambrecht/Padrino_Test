##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount("blog").to('/blog')
#   Padrino.mount("blog", :app_class => "BlogApp").to('/blog')
#   Padrino.mount("blog", :app_file =>  "path/to/blog/app.rb").to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount("Admin").host("admin.example.org")
#   Padrino.mount("WebSite").host(/.*\.?example.org/)
#   Padrino.mount("Foo").to("/foo").host("bar.example.org")
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount("AppName", :app_file => "path/to/file", :app_class => "BlogApp").to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '09b1d0e797e034e4e1f3e53f6f4cde1d3784e8fdbc193d3740bdc2bcc6270a5f'
  
  Twitter.configure do |config|
    config.consumer_key = 'YGLPyK1tHeN5vEmrZmt7aQ'
    config.consumer_secret = 'cdG71EZYHKz5DQgwHnzdsqKagk2jqXQIcpB4DBtUDk'
    config.oauth_token = '266165811-fBDxRpTVsEnDvzc8To1reVUcQsn5DSQqC4wwmZw2'
    config.oauth_token_secret = 'USpsZy3CuRItrAkUjHghHHf3K6WFvJibIK1moNqTzI'
  end
end

# Mounts the core application for this project
Padrino.mount("Edelbiter").to('/')

Padrino.mount("Admin").to("/admin")