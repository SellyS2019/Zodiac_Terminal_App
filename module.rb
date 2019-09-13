#module.rb
module Zodiac

  ##take date,month,year as arg and return western zodiac(String)
  def self.get_wzodiac(date, month, year) # calling zodiac gem and return zodiac output 
    zodiac = DateTime.new(year, month, date).zodiac_sign.to_s
    return zodiac
  end

  ##take year as arg and return chinese zodiac(String)
  def self.get_czodiac(year) # defining function to search for suitable array of chinese horoscope
    chinese = [[1909, "Rooster"], [1910, "Dog"],
               [1911, "Pig"], [1912, "Rat"],
               [1901, "Ox"], [1902, "Tiger"],
               [1903, "Rabbit"], [1904, "Dragon"],
               [1905, "Snake"], [1906, "Horse"],
               [1907, "Goat"], [1908, "Monkey"]]
    ch_zodiac = ""
    chinese.each { |item|
      result = (item[0] - year) % 12
      if (result == 0)
        ch_zodiac = item[1]
        return ch_zodiac
      end
    }
  end

  ##prompt user and return date month and year respectively
  def self.get_user_dob(prompt)
    x = true
    while (x)
      begin
        x = false
        user_dob = prompt.ask("Enter Date of birth (eg. 23/09/1994)", convert: :date)
        return user_dob.strftime("%d").to_i, user_dob.strftime("%m").to_i, user_dob.strftime("%Y").to_i
      rescue
        puts("Error".red.bold.underline + " Please Enter valid Date format (eg.01/12/2012)\n\n".light_red)
        x = true
      end
    end
  end

  ## retrieve api data using httparty to get data to be looped 
  #require api connection

  def self.learn_zodiac(zodiac, prompt)
    get_zodiac_api(zodiac) ? res = get_zodiac_api(zodiac) : return
    choice = ""
    while (choice != "back")
      sel = ["Famous People who have same Zodiac",
             "how_to_spot", "secret_wish", "hates", "good_traits",
             "bad_traits", "favorites", "compatibility", "element", "sun_dates", "back"]
      choice = prompt.select("Learn?".blue, sel)
      if (choice == "back")
        break
      elsif (choice == "Famous People who have same Zodiac")
        puts("#{choice} : " + res["famous_people"][0..5].join(",").green + "\n\n")
        go_on() 
      else
        if (res[choice].is_a? String)
          puts("#{choice} : " + res[choice].green + "\n\n")
          go_on()
        else
          puts("#{choice} : " + res[choice].join(",").green + "\n\n")
          go_on()
        end
      end
    end
  end
# method to match zodiac with another input 
  def self.match_zodiac(zodiac, prompt)
    puts("Enter Partner Zodiac")
    date, month, year = self.get_user_dob(prompt)
    zodiac_partner = Zodiac::get_wzodiac(date, month, year)
    res = get_zodiac_api(zodiac)
    res["compatibility"].each { |zodiac_com|
      if (zodiac_partner == zodiac_com.strip())
        puts("You are compatible!!!".yellow)
        return
      end
    }
    puts("You are not compatible!!!".red)
  end
# method to 
  def self.change_zodiac(prompt)
    sel = get_all_zodiac()
    choice = prompt.select("Change to".magenta, sel)
    return choice.to_s
  end
end
