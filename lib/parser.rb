require_relative 'webserver_log'

parser = WebServerLog.new(ARGV[0])
logs = parser.get_logs