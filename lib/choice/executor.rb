require 'choice/command'

module Choice
  module Executor
    class << self
      def execute(command:, args:)
        klass = Command.fetch(command)
        klass.new(args).execute
      rescue NameError => e
        "error, #{e}"
      end
    end
  end
end
