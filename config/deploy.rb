server "10.0.0.51", port: 80, roles: %i(:web :app :db), primary: true

set :application, "mySimpleBlog"
set :repo_url, "git@github.com:NeilAlishev/mySimpleBlog.git"
set :user,            "neil"
#set :passenger_threads,    [4, 16]
#set :passenger_workers,    0
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
#set :pty,             true
#set :use_sudo,        false
#set :stage,           :production
#set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/src/#{fetch(:application)}"
#set :ssh_options,     forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)

set :rbenv_type, :user
set :rbenv_ruby, '2.2.4'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml")

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
