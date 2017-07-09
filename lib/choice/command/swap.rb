module Choice
  module Command
    class Swap < Base
      private

      def action
        return if invalid?

        members[source_index], members[destination_index] = members[destination_index], members[source_index]

        set(member_key, members)
      end

      def message
        return '対象が正しく設定されていません。' if invalid?

        "「#{source}」と「#{destination}」の位置を入れ替えました。"
      end

      def invalid?
        return true if source.blank? or destination.blank?
        source_index.nil? or destination_index.nil?
      end

      def source
        @source ||= args[1] || ''
      end

      def destination
        @destination ||= args[2] || ''
      end

      def source_index
        @source_index ||= members.index(source)
      end

      def destination_index
        @destination_index ||= members.index(destination)
      end

      def members
        @members ||= begin
          _members = get(member_key)
          if _members.blank?
            []
          else
            JSON.parse(_members)
          end
        end
      end
    end
  end
end
