require 'discordrb'
require 'dotenv'


Dotenv.load('config.env.local', 'main.env')

@bot = Discordrb::Bot.new(token: ENV['config.token'], client_id: ENV['config.client_id'])

@rate_limiter = Discordrb::Commands::SimpleRateLimiter.new
@rate_limiter.bucket(:message, limit: 3, time_span: 60, delay: 5)

@noob_word_rate_limiter = Discordrb::Commands::SimpleRateLimiter.new
@noob_word_rate_limiter.bucket(:message, limit: 1, time_span: 90)

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

@bot.message(with_text: '!noob_hacker') do |event|
  next if @noob_word_rate_limiter.rate_limited?(:message, event.channel)
  event.respond 'Noobmeister: You Hacker!'
end

@bot.run
