# Samples to show how AMQP works

## the direct exchange example

```
 bundle exec ruby direct.rb
```

## fanout

```
 bundle exec ruby fanout.rb
```

## topic

```
 bundle exec ruby topic.rb
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

## the bind and unbind

```
 # run the producer
 bundle exec ruby color_producer.rb

 # open another terminal and run
 bundle exec ruby lazy_color_worker.rb

 # open the third terminal and run
 bundle exec ruby lazy_color_worker_binder.rb bind
 # or
 bundle exec ruby lazy_color_worker_binder.rb unbind
```
