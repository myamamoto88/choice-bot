module Choice
  module Command
    class Init < Base
      private

      def action
        store.set(group_name, members.shuffle)
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
