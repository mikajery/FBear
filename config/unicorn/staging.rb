worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15

app_folder = "#{release_path}"
working_directory app_folder

stderr_path app_folder + "/log/unicorn.stderr.log"
stdout_path app_folder + "/log/unicorn.stdout.log"

pid app_folder + "/tmp/pids/unicorn.pid"

listen app_folder + "tmp/.unicorn.sock", :backlog => 64
listen 8080, :tcp_nopush => true

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false  


before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end 

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end




# worker_processes 1

# app_folder = "/home/ubuntu/code/mp_search2"

# # Since Unicorn is never exposed to outside clients, it does not need to
# # run on the standard HTTP port (80), there is no reason to start Unicorn
# # as root unless it's from system init scripts.
# # If running the master process as root and the workers as an unprivileged
# # user, do this to switch euid/egid in the workers (also chowns logs):
# # user "unprivileged_user", "unprivileged_group"

# # Help ensure your application will always spawn in the symlinked
# # "current" directory that Capistrano sets up.
#  # available in 0.94.0+

# # listen on both a Unix domain socket and a TCP port,
# # we use a shorter backlog for quicker failover when busy
# listen app_folder + "tmp/.unicorn.sock", :backlog => 64
# listen 8080, :tcp_nopush => true

# # nuke workers after 30 seconds instead of 60 seconds (the default)
# timeout 10

# # feel free to point this anywhere accessible on the filesystem
# pid app_folder + "/tmp/pids/unicorn.pid"

# # By default, the Unicorn logger will write to stderr.
# # Additionally, ome applications/frameworks log to stderr or stdout,
# # so prevent them from going to /dev/null when daemonized here:
# stderr_path app_folder + "/log/unicorn.stderr.log"
# stdout_path app_folder + "/log/unicorn.stdout.log"

# # combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# # http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
# preload_app true
# GC.respond_to?(:copy_on_write_friendly=) and
#   GC.copy_on_write_friendly = true

# # Enable this flag to have unicorn test client connections by writing the
# # beginning of the HTTP headers before calling the application.  This
# # prevents calling the application for connections that have disconnected
# # while queued.  This is only guaranteed to detect clients on the same
# # host unicorn runs on, and unlikely to detect disconnects even on a
# # fast LAN.
# check_client_connection false

# before_fork do |server, worker|
#   # the following is highly recomended for Rails + "preload_app true"
#   # as there's no need for the master process to hold a connection
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.connection.disconnect!
# end

# after_fork do |server, worker|
#   # per-process listener ports for debugging/admin/migrations
#   # addr = "127.0.0.1:#{9293 + worker.nr}"
#   # server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)

#   # the following is *required* for Rails + "preload_app true",
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.establish_connection
# end
