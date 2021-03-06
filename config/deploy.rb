# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'foosball-api'
set :repo_url, 'git@gitlab.rambler.ru:i.konyukhov/foosball-api.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/foosball/app'

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :linked_files, fetch(:linked_files, []) + %w(.env.local)
# TODO: If future we will switch to store assets on webdav
# but now this directory will grow with every release
set :linked_dirs, fetch(:linked_dirs, []) + %w(log tmp/pids vendor/bundle public/assets)

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, %w{rake gem bundle ruby rails procodile}

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10
