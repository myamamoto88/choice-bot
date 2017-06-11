module Choice
  module Command
    class Add < Base
      private

      def action
        members << new_members
        store.set(member_key, members.flatten)
      end

      def message
        "「#{group_name}」に「#{new_members.join(', ')}」を追加しました。"
      end

      def new_members
        args[1..-1]
      end

      def members
        @members ||= JSON.parse(store.get(member_key))
      end
    end
  end
end
