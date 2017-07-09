module Choice
  module Command
    class Copy < Base
      private

      def action
        return if invalid?

        set(member_key(destination), source_members.shuffle)
        set(cursor_key(destination), 0)
      end

      def message
        return '対象が正しく設定されていません。' if invalid?

        "「#{source}」のメンバーをコピーして「#{destination}」を作成しました。"
      end

      def invalid?
        source.blank? or destination.blank?
      end

      def source
        args[0] || ''
      end

      def destination
        args[1] || ''
      end

      def source_members
        member_json_string = get(member_key(source))
        return [] if member_json_string.blank?
        JSON.parse(member_json_string)
      end
    end
  end
end
