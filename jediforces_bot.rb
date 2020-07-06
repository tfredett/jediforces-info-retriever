require 'discordrb'
require 'dotenv'


Dotenv.load('config.env.local', 'main.env')

@bot = Discordrb::Bot.new(token: ENV['config.token'], client_id: ENV['config.client_id'])

@rate_limiter = Discordrb::Commands::SimpleRateLimiter.new
@rate_limiter.bucket(:message, limit: 3, time_span: 60, delay: 5)

@bot.message(with_text: '!server_info') do |event|
  event.author.pm ENV['config.server_info']
end

@bot.message(with_text: '!server_rules') do |event|
  event.author.pm ENV['config.server_rules']
end

@bot.message(with_text: '!server_info_broadcast') do |event|
  next if @rate_limiter.rate_limited?(:message, event.channel)
  event.respond ENV['config.server_info']
end

@bot.message(with_text: '!server_rules_broadcast') do |event|
  next if @rate_limiter.rate_limited?(:message, event.channel)
  event.respond ENV['config.server_rules']
end

@bot.run
