# Set each property

@user.book_genre = Faker::Book.genre
@user.chuck_norris_fact = Faker::ChuckNorris.fact
@user.beer_name = Faker::Beer.name
@user.food_ingredient = Faker::Food.ingredient
@user.gameofthrones_house = Faker::GameOfThrones.house
@user.harry_potter_location = Faker::HarryPotter.location
@user.job_key_skill = Faker::Job.key_skill
@user.space_planet = Faker::Space.planet
@user.rockband_name = Faker::RockBand.name

# update the database with each property

User.find(103).update(
  book_genre:  @user.book_genre
  chuck_norris_fact: Faker::ChuckNorris.fact,
  beer_name: Faker::Beer.name,
  food_ingredient: Faker::Food.ingredient,
  gameofthrones_house: Faker::GameOfThrones.house,
  harry_potter_location: Faker::HarryPotter.location,
  job_key_skill: Faker::Job.key_skill,
  space_planet: Faker::Space.planet
  rockband_name: Faker::RockBand.name
)