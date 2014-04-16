require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

q = channel.queue 'amqp_samples.colors'

q.subscribe do |delivery_info, metadata, payload|
  puts "#{q.name} is going to use #{payload}"
end

loop do
  sleep 1
end
