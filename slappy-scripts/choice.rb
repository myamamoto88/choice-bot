hear /^\s*<@#{ENV['BOT_ID']}>\s*(?<command>\w+)\s*(?<args>.*)?/ do |event|
  text = Choice.execute(
    command: event.matches[:command],
    args: event.matches[:args]
  )
  say text, channel: event.channel
end
