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

	User.create(
		name: male_name_or_female_name,
		username: FactoryHelper::Internet.user_name(male_name_or_female_name),
		email: FactoryHelper::Internet.email(male_name_or_female_name),
		password: FactoryHelper::Internet.password,
		gender: @gender,
		image: UiFaces.sex(@gender),
		city: FactoryHelper::Address.city,
		zip: FactoryHelper::Address.zip
	)
end