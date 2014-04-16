require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

if ARGV[0] == 'bind'
  q = channel.queue 'amqp_samples.colors'
  q.bind 'amqp_samples.color.direct', routing_key: 'color'
else
  q = channel.queue 'amqp_samples.colors'
  q.unbind 'amqp_samples.color.direct', routing_key: 'color'
end
