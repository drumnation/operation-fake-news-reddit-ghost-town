# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rss'
require 'open-uri'

	  
	  urls = ['http://www.theonion.com/feeds/rss', 'http://nationalreport.net/feed/', 'http://duhprogressive.com/index.php/component/ninjarsssyndicator/?feed_id=1&format=raw', 'http://www.thespoof.com/rss/feeds/frontpage/rss.xml', 'http://www.newsbiscuit.com/feed/', 'http://21stcenturywire.com/feed/']
	  rss_results = []

	  	urls.each do |url|
	  		rss = RSS::Parser.parse(open(url).read, false).items[0..5]
			rss.each do |result|
				if result.description.empty?
					result.description = "Read me to discover what I'm all about...or not about about ;)"
				end
				result = Submission.create({ title: result.title, url: result.link, description: Sanitize.clean(result.description.slice(0..200)) })	
			end
		end

