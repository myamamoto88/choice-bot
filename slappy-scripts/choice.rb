hear '^hello, slappy!' do |event|
  logger.info 'received message!'
  say 'hello!!', channel: event.channel
end
