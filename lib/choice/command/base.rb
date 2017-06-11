module Choice
  module Command
    class Base
      def initialize(args)
        @args = args || []
      end

      def execute
        action

        message
      end

      protected

      attr_reader :args

      def action
      end

      def message
      end

      def key
        args[0]
      end
    end
  end
end
