# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.destroy_all
Game.create(id: 1, game_name: "Jumpy Cat", description: "Help jumpy cat leap over the bricks!", image: "jumpyCat1.png")
Game.create(id: 2, game_name: "Jumpy Cat EXTREME", description: "Jumpy cat is back! Now with lives and coins!", image: "jumpyCat2.png")