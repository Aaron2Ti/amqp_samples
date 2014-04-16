require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

q1 = channel.queue 'amqp_samples.q1'

q1.subscribe do |delivery_info, metadata, payload|
  puts "#{q1.name} got #{payload}"
end

x = channel.direct 'amqp_samples.direct'
x.publish 'Apple',  routing_key: 'fruit'


q1.bind x, routing_key: 'fruit'

x.publish 'Orange', routing_key: 'fruit'


q2 = channel.queue 'amqp_samples.q2'

q2.subscribe do |delivery_info, metadata, payload|
  puts "#{q2.name} got #{payload}"
end
q2.bind x, routing_key: 'fruit'

x.publish 'Pear',  routing_key: 'fruit'
x.publish 'Berry', routing_key: 'fruit'


q3 = channel.queue 'amqp_samples.q3'

q3.subscribe do |delivery_info, metadata, payload|
  puts "#{q3.name} got #{payload}"
end
q3.bind x, routing_key: 'sports'

x.publish 'Football', routing_key: 'sports'
x.publish 'Swim',     routing_key: 'sports'


q1.delete
q2.delete
q3.delete

x.delete

3.times do
  puts 'Waiting...'

  sleep 1
end
