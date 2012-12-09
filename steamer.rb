class Array
  # Extracts options from a set of arguments. Removes and returns the last
  # element in the array if it's a hash, otherwise returns a blank hash.
  #
  #   def options(*args)
  #     args.extract_options!
  #   end
  #
  #   options(1, 2)           # => {}
  #   options(1, 2, :a => :b) # => {:a=>:b}
  def extract_options!
    if last.is_a?(Hash) && last.extractable_options?
      pop
    else
      {}
    end
  end
end


require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = '98YivaWKFBQQ2IcczOkWlg'
  config.consumer_secret    = 'aqyJAsS3hl0PgZWNJfdaZJHhWQ7H7AvGcKj6UEpR6x4'
  config.oauth_token        = '22079139-7J3G9IoitUgGy5phuLuvfk0fr6a24TaO0ZJJiQ4dw'
  config.oauth_token_secret = 'AccS6n5P2N54qrIpXwbS9ZEAy61xGsj27ZVYhyOU'
  config.auth_method        = :oauth
end

# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.
TweetStream::Client.new.track('fiscal') do |status|
  # The status object is a special Hash with
  # method access to its keys.
  puts "#{status.text}"
end