#!/usr/bin/env ruby

require 'time'

counter = Hash.new(0)

exit if !File.exist?('requests.log')

end_time = Time.now
start_time = end_time - 300

File.open('requests.log', 'r') do |logfile|
  while line = logfile.gets
    request_time = "#{line.split[3].gsub('[','')} #{line.split[4].gsub(']','')}"
    error_code = line.split[8]
    if (start_time..end_time).cover?(Time.parse(request_time))
      counter[error_code] += 1 unless error_code =~ /2\d\d/
    end
  end
end


File.open('tmp/error_codes.csv', 'a') do |outfile|
  counter.each do |code, count|
    outfile.write("#{start_time.strftime("%Y%m%dT%H%M")},#{end_time.strftime("%Y%m%dT%H%M")},#{code},#{count}\n")
  end
end

