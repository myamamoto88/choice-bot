module Choice
  module Command
    class NormalChoice < Base
      private

      def action
        count.times.each do |_|
          cursor = store.get(cursor_key).to_i
          cursor = (cursor + 1) % members.size
          store.set(cursor_key, cursor)

          result << members[cursor]
        end
      end

      def message
        "「#{result.join(', ')}」が選ばれました。"
      end

      def count
        (args[1] || 1).to_i
      end

      def result
        @result ||= []
      end

      def members
        @members ||= JSON.parse(store.get(member_key))
      end
    end
  end
end
