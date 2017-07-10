# SEED USERS

require 'ui_faces'
require 'factory-helper'

100.times do
    def generate_gender
        random_gender = Random.new.rand(0..1)
    end

    def male_or_female(binary)
        binary == 0 ? "male" : 'female'
    end

    @gender = male_or_female(generate_gender)

    def male_name_or_female_name
        if @gender == "male"
        FactoryHelper::Name.male_first_name
        elsif @gender == "female"
        FactoryHelper::Name.female_first_name
        end
    end

	@user = User.create(
		name: male_name_or_female_name,
		username: FactoryHelper::Internet.user_name(male_name_or_female_name),
		email: FactoryHelper::Internet.email(male_name_or_female_name),
		password: FactoryHelper::Internet.password,
		gender: @gender,
		image: UiFaces.sex(@gender),
		city: FactoryHelper::Address.city,
		zip: FactoryHelper::Address.zip
	)
    i = 0
    i += 1
    puts "New User #{i} Generated"
    puts "Name: #{@user.username}"
    puts "Name: #{@user.email}"
    puts "Name: #{@user.password}"
    puts "Name: #{@user.gender}"
    puts "Name: #{@user.image}"
    puts "Name: #{@user.city}"
    puts "Name: #{@user.zip}"
    puts "-----------------------"
end

# SEED ARTICLES

require 'rss'
require 'open-uri'
require 'rubygems'

urls = ['http://www.theonion.com/feeds/rss', 'http://nationalreport.net/feed/', 'http://www.newsbiscuit.com/feed/', 'http://21stcenturywire.com/feed/']
id_array = User.all.collect {|user| user.id }

urls.each do |url|
		rss = RSS::Parser.parse(open(url).read, false).items[0..100]
		rss.each do |result|
			page = MetaInspector.new(result.link)
			img = page.images.best
			description = page.meta_tag["property"]["og:description"]
			if description.nil?
				description = ""
			end
			result = Submission.create({ title: page.meta_tag["property"]["og:title"], url: result.link, description: description << '...', image: img, user_id: id_array.shuffle.first })
            puts 'New Article Created'
            puts result
            puts '-------------------'
		end
end

# SEED COMMENTS

comments = File.foreach("/Users/davidmieloch/dev/project_2/db/comments.txt").map {|line| line.split("/n") }
users = User.all.collect {|user| user.id }
submission = Submission.all.collect {|article| article.id}

comments.flatten.each {|comment| Comment.create(body: comment.split("\r\n")[0], user_id: users.sample, submission_id: submission.sample)}
puts 'Comments'
p comments.flatten.first.split("\r\n")