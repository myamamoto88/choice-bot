module Choice
  module Command
    class Remove < Base
      private

      def action
        if targets.empty?
          store.del(member_key)
          return
        end

        store.set(member_key, members - targets)
      end

      def message
        return "「#{group_name}」を削除しました。" if targets.empty?
        "「#{group_name}」から「#{targets.join(', ')}」を削除しました。"
      end

      def targets
        args[1..-1] || []
      end

      def members
        @members ||= JSON.parse(store.get(member_key))
      end
    end
  end
end
