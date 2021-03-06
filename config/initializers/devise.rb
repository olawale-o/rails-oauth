Devise.setup do |config|
  # ==> Google Authentication
  config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], { 
    scope: 'userinfo.email, userinfo.profile',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50,
    skip_jwt: true
  }
end
