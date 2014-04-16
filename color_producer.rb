require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

x = channel.direct 'amqp_samples.color.direct'

%w[Red Blue].cycle do |c|
  puts "Send #{c}"

  x.publish c, routing_key: 'color'

  sleep 1
end
