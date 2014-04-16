# Samples to show how AMQP works

## the direct exchange example

```
 bundle exec ruby direct.rb
```

## the load banlancer

```
 # run the producer
 bundle exec ruby color_producer.rb

 # open another terminal and run
 bundle exec ruby color_worker.rb

 # open the third terminal and run
 bundle exec ruby color_worker.rb
```
