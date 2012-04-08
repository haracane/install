# ワーカーの数
worker_processes 2

# Rootディレクトリ
working_directory "/path/to/rails/project/"

# socket
listen '/path/to/rails/project/tmp/sockets/unicorn.sock', :backlog=>128
# listen 8080

# PID
pid "/path/to/rails/project/tmp/pids/unicorn.pid"

# log 
stderr_path File.expand_path('/var/log/twitter-trend/access.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('/var/log/twitter-trend/error.log', ENV['RAILS_ROOT'])

# no down time
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      # SIGTTOU だと worker_processes が多いときおかしい気がする
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

