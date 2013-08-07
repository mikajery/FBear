require "rvm/capistrano"

set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'  # install RVM
before 'deploy:setup', 'rvm:install_ruby'

set :stages, %w(production staging)
set :default_stage, 'staging'

require 'capistrano/ext/multistage'

set :application, 'cms'
set :repository, 'git@bitbucket.org:cslstudio/lll.git'
set :deploy_via, :remote_cache


set :user, 'deploy'
set :use_sudo, false
set (:deploy_to) { "/var/www/lll/#{stage_name}/" }

set :whenever_command, 'rvm use 2.0.0 do bundle exec whenever'

set :scm, :git
set :ssh_options, { :forward_agent => true }

role :web, 'lll.weboshin.ru' # Your HTTP server, Apache/etc
role :app, 'lll.weboshin.ru' # This may be the same as your `Web` server
role :db,  'localhost', :primary => true        # This is where Rails migrations will run

require 'bundler/capistrano'
#require "thinking_sphinx/deploy/capistrano"
#require "whenever/capistrano"

after 'deploy:update_code', :copy_database_config#, :copy_email_config

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

#task :copy_email_config, roles => :app do
#  mail_config = "#{shared_path}/email.yml"
#  run "cp #{mail_config} #{release_path}/config/email.yml"
#end

set (:unicorn_conf) {"#{release_path}/config/unicorn/#{stage_name}.rb"}
set (:unicorn_pid) {"#{shared_path}/pids/unicorn.pid"}
set (:unicorn_start_cmd) {"(cd #{deploy_to}/current; rvm use 2.0.0 do bundle exec unicorn_rails -Dc #{unicorn_conf})"}

set :bundle_cmd, 'rvm use 2.0.0 do bundle'


# - for unicorn - #
namespace :deploy do
  desc 'Start application'
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc 'Stop application'
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc 'Restart Application'
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end


set :max_asset_age, 2 ## Set asset age in minutes to test modified date against.

after 'deploy:finalize_update', 'deploy:assets:determine_modified_assets', 'deploy:assets:conditionally_precompile'

namespace :deploy do
  namespace :assets do

    desc 'Figure out modified assets.'
    task :determine_modified_assets, :roles => assets_role, :except => { :no_release => true } do
      set :updated_assets, capture("find #{latest_release}/app/assets -type d -name .git -prune -o -mmin -#{max_asset_age} -type f -print", :except => { :no_release => true }).split
    end

    desc 'Remove callback for asset precompiling unless assets were updated in most recent git commit.'
    task :conditionally_precompile, :roles => assets_role, :except => { :no_release => true } do
      if(updated_assets.empty?)
        callback = callbacks[:after].find{|c| c.source == 'deploy:assets:precompile' }
        callbacks[:after].delete(callback)
        logger.info('Skipping asset precompiling, no updated assets.')
      else
        logger.info("#{updated_assets.length} updated assets. Will precompile.")
      end
    end

  end
end

#after "deploy:setup", "thinking_sphinx:shared_sphinx_folder"