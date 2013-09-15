role :web, 'lll.weboshin.ru' # Your HTTP server, Apache/etc
role :app, 'lll.weboshin.ru' # This may be the same as your `Web` server
role :db,  'lll.weboshin.ru', :primary => true        # This is where Rails migrations will run

set :branch, 			'master'
set :repository_branch, 'master'
set :stage_name, 		'staging'
set :rails_env, 		'staging'