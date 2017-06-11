module Choice
  module Executor
    class << self
      def execute(command:, args:)
        "command: #{command} args: #{args.join}"
      end
    end
  end
end
