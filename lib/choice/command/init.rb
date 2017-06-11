module Choice
  module Command
    class Init < Base
      private

      def action
        store.set(member_key, members.shuffle)
        store.set(cursor_key, 0)
      end

      def message
        "「#{group_name}」の登録を完了しました。"
      end

      def members
        args[1..-1]
      end
    end
  end
end
