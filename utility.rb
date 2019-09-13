#utility.rb

def emoji(sign)
  emoji = { aries: ":aries:",
            taurus: ":taurus:",
            gemini: ":gemini:",
            cancer: ":cancer:",
            leo: ":leo:",
            virgo: ":virgo:",
            libra: ":libra:",
            scorpio: ":scorpio:",
            sagittarius: ":sagittarius:",
            capricorn: ":capricorn:",
            aquarius: ":aquarius:",
            pisces: ":pisces:" }

  return emoji[sign]
end

def get_all_zodiac
  return %w( Aries Taurus Gemini Cancer Leo Virgo Libra Scorpio Sagittarius Capricorn
             Aquarius Pisces )
end

module Utility

  ##take string as arg and return random color of that string
  def self.random_color(string)
    arr = string.split("")
    arr.map! { |str|
      num = Random.rand(1...6)
      case num
      when 1
        str = str.red
      when 2
        str = str.light_blue
      when 3
        str = str.green
      when 4
        str = str.magenta
      when 5
        str = str.yellow
      when 6
        str = str.cyan
      when 7
        str = str.light_green
      end
    }
    return arr.join("")
  end
end

def go_on # to display 'to continue' to be selected
  print "press any key to continue".magenta
  STDIN.getch
  print "            \r" # extra space to overwrite in case next sentence is short
end