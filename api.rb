#api.rb

##method for api connection
def get_zodiac_api(zodiac)
  begin
    url = "https://zodiacal.herokuapp.com/#{zodiac}"
    response = HTTParty.get(url)
    res = response.parsed_response
    return res[0]
  rescue
    puts("No Internet Connection".red)
  end
end
