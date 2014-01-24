role :web, 'lllooch.ru' 					# Your HTTP server, Apache/etc
role :app, 'lllooch.ru' 					# This may be the same as your `Web` server
role :db,  'lllooch.ru', :primary => true   # This is where Rails migrations will run

set :branch, 			      'production'
set :repository_branch, 'production'
set :stage_name, 		    'production'
set :unicorn_env,       'development'
set :rails_env, 		    'production'