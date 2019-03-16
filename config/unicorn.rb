app_dir = File.expand_path('../../', __FILE__)
shared_dir = File.expand_path('../../../shared/', __FILE__)

worker_processes 1
preload_app true

timeout 60

working_directory app_dir

listen "#{shared_dir}/tmp/sockets/unicorn.sock", :backlog => 64

stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

pid "#{shared_dir}/tmp/pids/unicorn.pid"
