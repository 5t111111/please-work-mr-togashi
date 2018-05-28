require 'sinatra'
require 'sinatra/cross_origin'
require 'nokogiri'
require 'open-uri'

configure do
  enable :cross_origin
end

get '/hxh' do
  doc = Nokogiri::HTML(open('http://www.shonenjump.com/j/weeklyshonenjump/'))
  result = doc.css('.ttl').map(&:content).include?('HUNTER×HUNTER')
  return { result: result }.to_json
end

get '/kenkakagyou' do
  # doc = Nokogiri::HTML(open('http://yanmaga.jp/weekly/'))
  # Web から休載かどうかわからない…
  return {}.to_json
end
