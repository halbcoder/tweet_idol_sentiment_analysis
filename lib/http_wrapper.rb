

def connection_options
{
:headers => {	
"Authorization" => 'Bearer 00D90000000wPJd!AQsAQOGSIC0Ixhhd_G9fWrQTwX_X7hnAERx99lfciATzcWzHsjMaU1OBX8fHqDSCxsM6aJqEZD9wzWDqo91MNug0bjvRMvhs',
"Content-Type" => 'application/json',
"User-Agent" => "Blah app"				
},
:body => content.to_json
}
end

def content
{ 
"body" => {
"messageSegments" => [
{
"type" => "Text",
"text" => "enrvoeirvn blajeoj"
}
]
}
}
end

url = URI.encode("https://ap1.salesforce.com/services/data/v30.0/chatter/feeds/record/a049000000HrVbI/feed-items")
options = connection_options
request = HTTParty::Request.new(Net::HTTP::Post, url, options)
response = request.perform

create_text_post("a049000000HrVbI", "test from app")

def connection_options
{
:headers => {	
"Authorization" => 'Bearer 00D90000000wPJd!AQsAQOGSIC0Ixhhd_G9fWrQTwX_X7hnAERx99lfciATzcWzHsjMaU1OBX8fHqDSCxsM6aJqEZD9wzWDqo91MNug0bjvRMvhs',
"User-Agent" => "Blah app"				
}
}
end

def content
end

url = URI.encode("https://ap1.salesforce.com/services/data/v30.0/chatter/feeds/record/a049000000HrVbI/feed-items")
options = connection_options
request = HTTParty::Request.new(Net::HTTP::Get, url, options)
response = request.perform

