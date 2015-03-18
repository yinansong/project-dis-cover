Monologue.config do |config|
  config.site_name = "Underground Wire"
  config.site_subtitle = "The official blog for Project DisCover"
  config.site_url = "http://example.com"
  # COME-BACK NOTE: this needs to be changed!!!

  config.meta_description = "This is a blog about Project DisCover and its manholecovers."
  config.meta_keyword = "music, fun"

  config.admin_force_ssl = false
  config.posts_per_page = 10

  config.disqus_shortname = "my_disqus_shortname" 
  # COME-BACK NOTE: this needs to be changed!!!

  # LOCALE
  config.twitter_locale = "en" # "fr"
  config.facebook_like_locale = "en_US" # "fr_CA"
  config.google_plusone_locale = "en"

  # config.layout               = "layouts/application"
  # COME-BACK NOTE: this needs to be changed!!!

  # ANALYTICS
  # config.gauge_analytics_site_id = "YOUR COGE FROM GAUG.ES"
  # config.google_analytics_id = "YOUR GA CODE"
  # COME-BACK NOTE: this needs to be changed!!!

  config.sidebar = ["latest_posts", "latest_tweets", "categories", "tag_cloud"]


  #SOCIAL
  # COME-BACK NOTE: this needs to be changed!!!
  config.twitter_username = "myhandle"
  config.facebook_url = "https://www.facebook.com/myhandle"
  config.facebook_logo = 'logo.png'
  config.google_plus_account_url = "https://plus.google.com/u/1/.../posts"
  config.linkedin_url = "http://www.linkedin.com/in/myhandle"
  config.github_username = "myhandle"
  config.show_rss_icon = true

end