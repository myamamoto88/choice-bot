module Choice
  module Command
    class Show < Base
      private

      def members
        _members = store.get(member_key)
        return [] if _members.blank?
        JSON.parse(_members)
      end

      def message
        return "「#{group_name}」は登録されていません。" if members.empty?

        <<-EOS
グループ名: #{group_name}
メンバー: #{members.join(', ')}

「#{members[cursor]}」まで選ばれました。
        EOS
      end

      def cursor
        store.get(cursor_key).to_i % members.size
      end
    end
  end
end
