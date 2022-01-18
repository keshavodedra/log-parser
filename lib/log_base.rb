class LogBase
  attr_reader :logfile_path, :log_entries

  def initialize(logfile_path)
    @logfile_path = logfile_path
    @log_entries = Hash.new { |h, k| h[k] = [] }
  end
end
