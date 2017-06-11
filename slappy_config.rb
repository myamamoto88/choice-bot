$LOAD_PATH.push File.expand_path('./../lib', __FILE__)

require 'choice'

Slappy.configure do |config|
  config.token = ENV['BOT_TOKEN']
  config.robot.username = 'チョイス'
  config.robot.icon_url = 'https://user-images.githubusercontent.com/7444925/27010947-84e8c1c6-4eeb-11e7-8d82-41ba6322d1a0.png'

  # debug
  #config.logger = Logger.new(STDOUT)
  #config.logger.level = Logger::DEBUG
end
