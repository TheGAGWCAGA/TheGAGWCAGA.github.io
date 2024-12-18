#!/usr/bin/env ruby

require 'yaml'

main_category = ""
main_category_sub = ""

games = []

def string_difference_percent(a, b)
  longer = [a.size, b.size].max
  same = a.each_char.zip(b.each_char).count { |a,b| a&.downcase == b&.downcase }
  (longer - same) / a.size.to_f
end

Dir.glob("_games/*.markdown").each do |md|
  games << {
    title: YAML.load_file(md)['title'],
    filename: md
  }
end

File.open("awards.dat") do |f|
  f.each_line do |line|
    next if line.strip.empty?
    if line.strip=~/\A([A-Za-z][^(]*) \((.*)\)\Z/
      main_category = $1
      main_category_sub = $2

      p main_category
      p main_category_sub
    elsif line.strip=~/\A([^:]*): (.*) by (.*)\Z/
      award = $1
      name = $2
      publisher = $3
      found = games.sort_by{|g| string_difference_percent(name, g[:title])}.first

      game = YAML.load_file(found[:filename])

      game["award_category"] = main_category
      game["award_category_subtitle"] = main_category_sub
      game["award"] = award

      File.open(found[:filename], "w+") do |out|
        out.puts game.to_yaml
        out.puts "---"
        out.puts
      end
    end
  end
end
