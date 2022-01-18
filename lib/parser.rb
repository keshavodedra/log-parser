require_relative 'webserver_log'

parser = WebServerLog.new(ARGV[0])
parser.generate_logs

parser.most_page_views
parser.unique_page_view
