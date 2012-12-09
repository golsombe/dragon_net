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
require 'thread'

def tracker(keywords)
	TweetStream::Client.new.track(keywords) do |status|
	  # The status object is a special Hash with
	  # method access to its keys.
	  # RT @madari59: El 80% de la inspección fiscal se centra en pymes y autónomos... http://t.co/TxR0iMzO ...cuando el 71,7% de la evasión la hace ...
	  # danicorock::es
	  if status.text.include? 'RT'
		  puts "keywords: #{keywords.to_s} @ #{Time.now}"
	  end
	end
  end


TweetStream.configure do |config|
  config.consumer_key       = '98YivaWKFBQQ2IcczOkWlg'
  config.consumer_secret    = 'aqyJAsS3hl0PgZWNJfdaZJHhWQ7H7AvGcKj6UEpR6x4'
  config.oauth_token        = '22079139-7J3G9IoitUgGy5phuLuvfk0fr6a24TaO0ZJJiQ4dw'
  config.oauth_token_secret = 'AccS6n5P2N54qrIpXwbS9ZEAy61xGsj27ZVYhyOU'
  config.auth_method        = :oauth
end

t1 = Thread.new{tracker('fiscal')}
t2 = Thread.new{tracker('Obama')}
t1.join
t2.join

# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.
