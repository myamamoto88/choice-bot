require 'redis'
require 'json'

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

      def action; end
      def message; end

      def group_name
        args[0]
      end

      def member_key(key = group_name)
        "#{key}:member"
      end

      def cursor_key(key = group_name)
        "#{key}:cursor"
      end

      def set(key, value)
        store.set(key, value.to_json)
      end

      def get(key)
        value = store.get(key)
        raise ::Choice::Executor::NotFoundKey, key if value.nil?
				value
      end

      private

      def store
        @client ||= Redis.new(url: 'redis://redis:6379')
      end
    end
  end
end
