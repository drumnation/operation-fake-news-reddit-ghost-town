# Addictme
### Operation-fake-news-reddit-ghost-town

![Watch the Demo](/demo.gif)

## Concept

It may not be well known that Reddit got it's start by faking most of it's community until it "made it." The initial group that started Reddit had accounts that let them post as multiple users so they could talk to each other and bots that spoofed activity.  Obviously nobody wants to join a community site with no activity, users, or content... what else can one do to launch a new community site besides fake it at first?

The inspiration for this project was all the 'fake news' related chatter in the culture sphere combined with this concept of faking a site's beginnings. Part conceptual art, part website, we chose to clone a number of Reddit's basic features and then to generate only fake news content and a fake community to make it appear as if the site were actually active.

### Built with Ruby on Rails, key challenges were:

-  Creating Rails seed file that ingested fake news RSS feeds and generated ‘Reddit’ style posts.
-  Utilizing Faker and UI_Faces Gems to generate 100 fake users, each voting, posting, and commenting.
-  ActiveRecord queries for sorting posts based on vote total.
- Utilizing Materialize for front-end styling and Meta-Inspector for scraping and auto-population of post meta-data.
