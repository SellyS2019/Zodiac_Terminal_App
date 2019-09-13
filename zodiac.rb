#Zodiac.rb
%w{colorize zodiac httparty tty-prompt ./api.rb ./module.rb ./utility.rb ruby_emoji}.each { |x| require x }


prompt = TTY::Prompt.new    #initiate an object from tty-prompt class to use to display user selections

date, month, year = Zodiac::get_user_dob(prompt) # this method prompt user and return date,month,year resp.

zodiac = Zodiac::get_wzodiac(date, month, year) # calling get_wzodiac from module.rb
puts(Utility::random_color("\nYour Zodiac is ") + Utility::random_color(zodiac).underline.bold)

# to take user selection and display user selection

choice = ""
while (choice != "quit")
  choice = prompt.select("\nWhat whould you like to know about your " +
                         RubyEmoji.parse("#{emoji(zodiac.downcase.to_sym)}").yellow + " " + # need RubyEmoji gem
                         "#{zodiac}".green + " " + RubyEmoji.parse("#{emoji(zodiac.downcase.to_sym)}").yellow +
                         +"\nPlease select?".blue,
                         ["Learn", "Match Zodiac", "Horoscope", "Chinese Zodiac", "Learn Other Zodiac", "quit"])
  case choice
  when "Learn"
    Zodiac::learn_zodiac(zodiac, prompt) # calling function from module.rb
  when "Match Zodiac"
    Zodiac::match_zodiac(zodiac, prompt)
  when "Horoscope"
    puts("Coming Soon")
  when "Chinese Zodiac"
    puts("Chinese Zodiac : " + Zodiac::get_czodiac(year).yellow)
  when "Learn Other Zodiac"
    zodiac = Zodiac::change_zodiac(prompt)
  when "quit"
    system "clear"
    break
  end
end