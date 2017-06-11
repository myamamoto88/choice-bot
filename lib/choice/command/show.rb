module Choice
  module Command
    class Show < Base
      private

      def members
        JSON.parse(store.get(group_name))
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
