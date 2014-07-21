require "open-uri"
require "json"

module IdolApi
		URL = IdolApiConfig["url"]
		API_KEY = IdolApiConfig["api_key"]
		VERSION = IdolApiConfig["version"]
		
		LANGUAGES = {
			"english" => "eng",
			"french" => "fre",
			"spanish" => "spa",
			"german" => "ger",
			"italian" => "ita",
			"chineese" => "chi",
		}


		def identify_language(text)
			query_params = %(text=#{text}).tr(" ", "+")
			url = construct_target_url(:identifylanguage, query_params)

			URI.parse(url).read
		end

		def detect_sentiment(text, language)
			lang = LANGUAGES[language] ? LANGUAGES[language] : "eng"
			query_params = %(text=#{text}&lang=#{lang}).tr(" ", "+")
			url = construct_target_url(:detectsentiment, query_params)	
			
			URI.parse(url).read
		end

		def highlight_text(text, terms, start_tag)
			query_params = %(text=#{text}&highlight_expression=#{terms}&start_tag=#{start_tag}).tr(" ", "+")
			url = construct_target_url(:highlighttext, query_params)
			
			URI.parse(url).read
		end

		private
			def construct_target_url(api, query_params)
				path = %(#{URL}/#{api}/#{VERSION})
				query_string = %(?#{query_params}&apikey=#{API_KEY})

				URI.encode(path+query_string)
			end

end

