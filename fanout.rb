require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

x = channel.fanout 'amqp_samples.fanout'

q1 = channel.queue 'amqp_samples.q1'
q1.subscribe do |delivery_info, metadata, payload|
  puts "#{q1.name} got #{payload}"
end

q1.bind x

q2 = channel.queue 'amqp_samples.q2'
q2.subscribe do |delivery_info, metadata, payload|
  puts "#{q2.name} got #{payload}"
end

q2.bind x

x.publish 'Apple'
x.publish 'Football'

q1.delete
q2.delete
x.delete
