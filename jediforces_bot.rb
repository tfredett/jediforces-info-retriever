require 'discordrb'
require 'dotenv'

Dotenv.load('config.env.local', 'main.env')

puts ENV['config.token'] 
# @bot = Discordrb::Bot.new token 
