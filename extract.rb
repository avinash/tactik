#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'hpricot'
 
@url = "http://poweredge/telegraph.html"
@response = ''
 
open(@url, "User-Agent" => "Ruby/#{RUBY_VERSION}",
  "From" => "avinash@noulakaz.net",
  "Referer" => "http://www.noulakaz.net/") { |f|

  @response = f.read
  doc = Hpricot(@response)

  3.upto(100) { |row|
    @team1  = (doc/"/html/body/form/table/tr[5]/td/div/table[9]/tr[#{row}]/td/a[1]").inner_html
    @score1 = (doc/"/html/body/form/table/tr[5]/td/div/table[9]/tr[#{row}]/td/span[1]").inner_html
  
    @team2  = (doc/"/html/body/form/table/tr[5]/td/div/table[9]/tr[#{row}]/td/a[2]").inner_html
    @score2 = (doc/"/html/body/form/table/tr[5]/td/div/table[9]/tr[#{row}]/td/span[2]").inner_html
  
    puts @team1
    puts @score1
    puts @team2
    puts @score2
  }
}
