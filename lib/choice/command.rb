require 'choice/command/base'
require 'choice/command/init'
require 'choice/command/random_choice'

module Choice
  module Command
    class << self
      def fetch(command)
        command_name = command.split("_").map { |n| n.capitalize }.join
        const_get(command_name)
      end
    end
  end
end
