module Choice
  module Command
    class Shuffle < Base
      private

      def action
        store.set(member_key, after_members)
        store.set(cursor_key, 0)
      end

      def before_members
        @before_members ||= begin
          _members = get(member_key)
          if _members.blank?
            []
          else
            JSON.parse(_members)
          end
        end
      end

      def after_members
        @after_members ||= before_members.shuffle
      end

      def message
        <<-EOS
「#{group_name}」をシャッフルしました。

前: #{before_members.join(', ')}
後: #{after_members.join(', ')}
        EOS
      end
    end
  end
end
