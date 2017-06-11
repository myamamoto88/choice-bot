$LOAD_PATH.push File.expand_path('./../lib', __FILE__)

require 'choice'

Slappy.configure do |config|
  config.token = ENV['BOT_TOKEN']
  # config.robot.username = 'slappy'
  # config.robot.icon_url = nil


  # debug
  #config.logger = Logger.new(STDOUT)
  #config.logger.level = Logger::DEBUG
end
