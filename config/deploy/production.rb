set :stage, :production
set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle)
set :linked_files, %w(.env config/database.yml config/secrets.yml)
set :workers, '*': 2
set :log_level, :debug

role :app, %w(takita@160.16.221.72)
role :web, %w(takita@160.16.221.72)
role :db, %w(takita@160.16.221.72)
