require 'mongo'

include Mongo

db = Connection.new.db('dragon-net')

@targets = db.collection('targets')

new_target = {:target_text => 'Welcome to DragonNet http://bit.ly/VsiJyD', :owner=> "golsombe", :retweet_count=>0, :total_count=>1, :created_on=> Time.now}

target_id = @targets.insert(new_target)

puts @targets.find(:id=>target_id).first

