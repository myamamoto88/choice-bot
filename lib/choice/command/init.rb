module Choice
  module Command
    class Init < Base
      private

      def action

      end

      def message
        "Success initialize. members: #{members.join(',')}"
      end

      def members
        args[1..-1]
      end
    end
  end
end
