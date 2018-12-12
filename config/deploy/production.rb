server '31.186.103.128', user: 'root', roles: %w(app web db)

set :puma_bind, 'tcp://0.0.0.0:3000'
set :puma_preload_app, true