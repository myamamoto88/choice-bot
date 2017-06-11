require 'choice/command'

module Choice
  module Executor
    class << self
      def execute(command:, args:)
        klass = Command.fetch(command)
        klass.new(args).execute
      rescue NameError => e
        puts "error, #{e}"
        text = ::Choice::Command::Help.new([]).execute
        "#{command}コマンドは存在しません。#{text}"
      end
    end
  end
end
