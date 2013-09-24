role :web, 'dev.lllooch.ru' # Your HTTP server, Apache/etc
role :app, 'dev.lllooch.ru' # This may be the same as your `Web` server
role :db,  'dev.lllooch.ru', :primary => true        # This is where Rails migrations will run

set :branch, 			'master'
set :repository_branch, 'master'
set :stage_name, 		'development'
set :rails_env, 		'development'