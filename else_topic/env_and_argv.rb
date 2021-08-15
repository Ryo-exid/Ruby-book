# 起動時引数

name = ENV['MY_NAME']
email = ARGV[0]
age = ARGV[1]

puts "name: #{name}, email: #{email}, age: #{age}"


=begin


# ターミナルで以下を入力

$ export MY_NAME=ALICE

$ ruby else_topic/env_and_argv.rb alice@example.com 20


=end