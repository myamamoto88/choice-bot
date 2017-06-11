hear /^\s*<@#{ENV['BOT_ID']}>\s*(?<command>\w+)\s*(?<args>[\w\s]*)?/ do |event|
  say 'hello!!', channel: event.channel
end
