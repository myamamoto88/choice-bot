require 'choice/command'

module Choice
  module Executor
    class NotFoundKey < StandardError; end

    class << self
      def execute(command:, args:)
        klass = Command.fetch(command)
        klass.new(args).execute
      rescue NameError => e
        puts "error, #{e}"
        text = ::Choice::Command::Help.new([]).execute
        "#{command}コマンドは存在しません。#{text}"
      rescue NotFoundKey => e
        text = ::Choice::Command::Help.new([]).execute
        "指定されたグループ、またはメンバーは存在しません。#{text}"
      end
    end
  end
end
