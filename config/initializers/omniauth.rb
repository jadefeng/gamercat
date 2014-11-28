OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
 # Facebook
  # provider :facebook, '392024830972235', 'f0bc5acfb0f4406a215dcbb016c003ef'
  # Google
  # provider :google_oauth2, '843531934697-j6vg1oshnb0pet846mkfgmqa9v6qphh7.apps.googleusercontent.com', 'JThbqBFoXfC8R2KyB4YgVeEJ', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :google_oauth2, '843531934697-j6vg1oshnb0pet846mkfgmqa9v6qphh7.apps.googleusercontent.com', 'JThbqBFoXfC8R2KyB4YgVeEJ', { scope: 'userinfo.email,userinfo.profile,https://www.google.com/m8/feeds', access_type: 'offline', approval_prompt: '', client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}} }
  # Twitter
  provider :twitter, 'vD8CDWEwZxOqJ2ygCY6IJ0zs0', 'fDV2tViFwJoJB23JL40cb1N1j7dN9F1PSPWCINg2egHFq0mrYv'
end