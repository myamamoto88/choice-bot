module Choice
  module Command
    class Show < Base
      private

      def members
        JSON.parse(store.get(member_key))
      end

      def message
        <<-EOS
グループ名: #{group_name}
メンバー: #{members.join(', ')}
        EOS
      end
    end
  end
end
