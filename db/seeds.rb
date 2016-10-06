# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def self.start
    seed = Seed.new
    seed.generate_ideas
  end

  def generate_ideas
    5.times do |i|
      Idea.create( title: (Faker::Hipster.sentence).capitalize, body: Faker::Hipster.paragraph(4) )
    end
    puts "Ideas created... hopefully..."
  end
end

Seed.start
