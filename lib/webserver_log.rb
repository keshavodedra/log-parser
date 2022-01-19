require_relative 'log_base'

class WebServerLog < LogBase
  def generate_logs
    return p "There is no file named '#{logfile_path}'." unless valid_file_path?(logfile_path)

    File.open(logfile_path).each do |line|
      url, ip_address = line.split
      log_entries[url] << ip_address
    end
  end

  def most_page_views
    page_logs(log_entries, false)
  end

  def unique_page_view
    page_logs(log_entries, true)
  end

  private

  def valid_file_path?(path)
    File.exist? path
  end

  def page_logs(log_entries, is_unique)
    return p 'There is no logs in the file' unless log_entries.count.positive?

    page_logs = page_view_count(log_entries, is_unique)
    title = is_unique ? 'Unique Views' : 'Page Views'
    show_output(page_logs, title)
  end

  def page_view_count(logs, is_unique)
    arr = {}
    logs.map do |key, val|
      arr[key] = is_unique ? val.uniq.size : val.size
    end
    arr.sort_by { |_key, value| value }.reverse.to_h
  end

  def show_output(logs, title)
    puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
    puts "| # | #{title.rjust(15)}"
    puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'

    @view_title = (title == 'Page Views' ? 'visits' : 'unique views')

    logs.each_with_index do |(page, views), index|
      puts "| #{index + 1} | #{page.rjust(15)} has #{views} #{@view_title}"
    end
    puts '---------------------------------------------'
  end
end
