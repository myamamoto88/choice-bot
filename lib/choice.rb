require 'choice/executor'

module Choice
  class << self
    def execute(command:, args:)
      Executor.execute(command: command, args: args.split)
    end
  end
end
