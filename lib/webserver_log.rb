class WebServerLog

  def initialize(logfile_path)
      @logfile_path = logfile_path
  end

  def get_logs
    return p "There is no file named '#{@logfile_path}'." unless (is_valid_file_path?(@logfile_path))
    format_logs
  end

  def format_logs
    log_entries = Hash.new { |h, k| h[k] = [] }
      File.open(@logfile_path).each do |line|
        url, ip_address = line.split
        log_entries[url] << ip_address
      end
     most_page_views(log_entries)
  end

  def most_page_views logs
    return p "There is no logs in the file" unless(logs.count > 0)
    most_page_logs = page_view_count(logs, false)
    show_output(most_page_logs, 'Page Views')

    unique_page_view(logs)
  end

  def unique_page_view logs
    unique_page_logs = page_view_count(logs, true)
    show_output(unique_page_logs, 'Unique Views')
  end

  private

  def is_valid_file_path?(path)
    return File.exists? path
  end

  def page_view_count(logs, is_unique)
    arr = Hash.new
    logs.map do |key, val|
      arr[key] = is_unique ? val.uniq.size : val.size
    end
    arr.sort_by {|_key, value| value}.reverse.to_h
  end

  def show_output(logs, title)
    puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
    puts '| # | ' + title.rjust(15) 
    puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
    
    @test = (title == "Page Views" ? 'visits' : 'unique views')

    logs.each_with_index do |(page, views), index|
      puts "| #{index + 1} | #{page.rjust(15)} has #{views}" + " " + @test
    end
    puts '---------------------------------------------'
  end

end