module TwitterApi

		# Authenticate Twitter REST API
		def client
			@client = Twitter::REST::Client.new do |config|
			  config.consumer_key        = TwitterConfig["consumer_key"]
			  config.consumer_secret     = TwitterConfig["consumer_secret"]
			  config.access_token        = TwitterConfig["access_token"]
			  config.access_token_secret = TwitterConfig["access_token_secret"]
			end		
		end

		# Search tweets with a given hashtag
		def search_tweets(hashtag, param_values)			
			hashtag = fetch_hashtag(hashtag, param_values[:include_rts])			
			client.search(hashtag, query_params(param_values))
		end

		# Fetch a particular tweet with ID
		def fetch_tweet(tweet_id)
			client.status(tweet_id)
		end

		private
			def fetch_hashtag(hashtag, include_rts)
				hashtag = hashtag.blank? ? "#F1" : hashtag
				if include_rts
					hashtag[0].eql?("#") ? "#{hashtag}" : "##{hashtag}"
				else
					# Search without the word 'RT' in the tweet.
					hashtag[0].eql?("#") ? "#{hashtag} -RT" : "##{hashtag} -RT"
				end
			end

			def query_params(param_values)
				{					
					:since => param_values[:since_date].strftime("%Y-%m-%d"),
					:until => param_values[:until_date].strftime("%Y-%m-%d"),
					:max_id => param_values[:max_id] # This param fetches tweets older than the given tweet ID
				}
			end	
			
end
