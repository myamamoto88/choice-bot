module Choice
  module Command
    class Help < Base
      private

      def message
        <<-EOS
使い方は <https://github.com/myamamoto88/choice-bot|こちら> で確認してください。
        EOS
      end
    end
  end
end
