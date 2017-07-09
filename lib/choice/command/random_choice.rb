module Choice
  module Command
    class RandomChoice < Base
      private

      def action
        @shuffled = false

        count.times.each do |_|
          if reset?
            shuffle
            member = " *#{members[next_cursor]}* "
          else
            member = members[next_cursor]
          end
          result << member
          set(cursor_key, next_cursor)
        end
      end

      def reset?
        (current_cursor + 1) == members.size
      end

      def current_cursor
        get(cursor_key).to_i
      end

      def next_cursor
        (current_cursor + 1) % members.size
      end

      def message
        _message = "「#{result.join(', ')}」が選ばれました。"
        _message += "\n*太字* の箇所でシャッフルされました。" if shuffle?
        _message
      end

      def count
        (args[1] || 1).to_i
      end

      def result
        @result ||= []
      end

      def members
        @members ||= JSON.parse(get(member_key))
      end

      def shuffle
        @shuffled = true
        @members = members.shuffle
        set(member_key, members)
      end

      def shuffle?
        @shuffled
      end
    end
  end
end
