set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'
set :deploy_to, '/var/www/app/splat'

server '192.168.12.58', user: 'deploy', roles: %w{ web app db }
