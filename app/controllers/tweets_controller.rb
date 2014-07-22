require 'idol_api'
require 'twitter_api'

class TweetsController < ApplicationController
	include IdolApi
	include TwitterApi
	
	def index
		@tweets = search_tweets(params[:hashtag], param_values(params)).take(25)
	end

	def show
		@tweet = fetch_tweet(params[:id])
		@language = JSON.parse identify_language(@tweet.text)
		@sentiment = JSON.parse detect_sentiment(@tweet.text, @language)
		
		@positive_terms = @sentiment["positive"].sort_by{ |hsh| hsh["score"] }.reverse
		positive_sentiment_terms = @positive_terms.collect{ |hsh| hsh["sentiment"] }		
		@pos_highlighted_tweet = JSON.parse(highlight_text(
			@tweet.text, positive_sentiment_terms, "<span class='pos_highlight'>"))
		
		@negative_terms = @sentiment["negative"].sort_by{ |hsh| hsh["score"] }.reverse
		negative_sentiment_terms = @negative_terms.collect{ |hsh| hsh["sentiment"] }
		@neg_highlighted_tweet = JSON.parse(highlight_text(
			@tweet.text, negative_sentiment_terms, "<span class='neg_highlight'>" ))
	end

	private
		def param_values(params)
			{
				:since_date => start_date(params),
				:until_date => end_date(params),
				:max_id => params[:max_id],
				:include_rts => params[:include_rts]
			}
		end

	  def start_date(params)
	    parse_from_date(params) ? Time.parse(parse_from_date(params)) : (Time.now.ago 30.day)
	  end
	  
	  def end_date(params)  
	    parse_to_date(params) ? Time.parse(parse_to_date(params)).end_of_day : Time.now
	  end
	  
	  def parse_from_date(params)
	    (params[:date_range].split(" - ")[0]) || params[:date_range] unless params[:date_range].blank?
	  end
	  
	  def parse_to_date(params)
	    (params[:date_range].split(" - ")[1]) || params[:date_range] unless params[:date_range].blank?
	  end
end