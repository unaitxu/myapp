# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "my_app"
set :repo_url, "git@github.com:unaitxu/myapp.git"

set :deploy_to, '/home/deploy/my_app'

append :linked_files, "config/database.yml", "config/secrets.yml", ".rbenv-vars"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

server 'ec2-52-28-158-69.eu-central-1.compute.amazonaws.com', user: 'deploy', roles: %w{app db web}

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_control_app, false
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
