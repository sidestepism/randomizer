#!/usr/bin/env ruby

require "google-search"
require "random-word"
require "twitter"
require "tempfile"
word = RandomWord.nouns.next

client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'iN67m7erKi0OW8FZmYlk7g'
    config.consumer_secret = '7XBkHs6Zv7Cvw0SE0RzFfuak6ezaBp39xBiiQZxDw'
    config.access_token = '18599665-rTPutRYFOHRroFjLwmx1aWA6DGIgVgiUz6tLiA4Tc'
    config.access_token_secret = 'uRpWPPsCOrFwOCxygEJXxorBGpypxOpgQPt3VFmKoRE'
end 

p word
Google::Search::Image.new(:query => word).each do |image|
	p image.uri
	file = Tempfile.new('image')
	file << open(image.uri).read
	p file.path
	file.close
	file.open
    client.update_profile_image(file)
    break
end



