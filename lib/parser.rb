require_relative 'webserver_log'

parser = WebServerLog.new(ARGV[0])
parser.get_logs