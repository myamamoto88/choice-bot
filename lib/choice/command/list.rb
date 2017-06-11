module Choice
  module Command
    class List < Base
      private

      def groups
        @groups ||= begin
          pattern = member_key("*")
          store.keys(pattern).map { |group| group.split(':').first }
        end
      end

      def message
        return 'グループは登録されていません。' if groups.empty?

        <<-EOS
登録されているグループです。

#{groups.join("\n")}
        EOS
      end
    end
  end
end
