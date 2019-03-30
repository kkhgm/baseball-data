class Scraping
  require 'mechanize'

  num = 1
  agent = Mechanize.new
    page = agent.get("https://baseball-freak.com/game/18/dragons.html")
    elements = page.search('td')

    elements.each do |ele|
      ele = ele.inner_text
      judge(ele)
    end


    def self.judge(ele)
      if ele == "●" || ele == "○" || ele == "△"
          if ele == "●"
            res = -1
          elsif ele == "○"
            res = 1
          else
            res = 0
          end
          puts res
        # game = Doragon.new(game: res)
        # game.save
      end
    end
end
