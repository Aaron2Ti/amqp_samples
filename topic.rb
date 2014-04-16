require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

x = channel.topic 'amqp_samples.weather.topic'

q1 = channel.queue 'amqp_samples.china_weather'
q1.subscribe do |delivery_info, metadata, payload|
  puts "#{q1.name} got #{payload}"
end

q1.bind x, routing_key: 'weather.china.#'

q2 = channel.queue 'amqp_samples.beijing_weather'
q2.subscribe do |delivery_info, metadata, payload|
  puts "#{q2.name} got #{payload}"
end

q2.bind x, routing_key: 'weather.china.*'

q3 = channel.queue 'amqp_samples.haidian_weather'
q3.subscribe do |delivery_info, metadata, payload|
  puts "#{q3.name} got #{payload}"
end

q3.bind x, routing_key: 'weather.china.beijing.haidian'

x.publish 'Haidiang is not good',     routing_key: 'weather.china.beijing.haidian'
x.publish 'Beijing is also terrible', routing_key: 'weather.china.beijing'
x.publish 'China is ok',              routing_key: 'weather.china'

q1.delete
q2.delete
q3.delete
x.delete


2.times { sleep 1 }
