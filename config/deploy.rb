# config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'www.maxcole.com'
set :repo_url, 'git@github.com:rjayroach/www.maxcole.com.git'
set :deploy_to, "/srv/apps/#{fetch(:application)}"

set :log_level, :info

set :linked_files, %w{config/database.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :kill, "--signal USR2 $(<\"#{release_path.join('tmp/pids/unicorn.pid')}\")"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  set :rbenv_type, :user # or :system, depends on your rbenv setup
  set :rbenv_ruby, '2.1.2'
  set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
  set :rbenv_map_bins, %w{rake gem bundle ruby rails}
  set :rbenv_roles, :all # default value
end
