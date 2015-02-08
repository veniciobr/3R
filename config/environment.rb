# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rnarrails::Application.initialize!

#Rails.logger = Logger.new(STDOUT)

#class Logger
#  def format_message(severity, timestamp, progname, msg)
#    "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
#  end
#end