puts "Destroying the old database"
GameSession.destroy_all
User.destroy_all
Game.destroy_all
puts "All the old database has been deleted"
puts "Creating new users..."
user1 = User.create!(email: "aaaaa@aaaaa.fr",password: "123456", city: "bordeaux")
user2 = User.create!(email: "bbbbb@bbbbb.fr",password: "123456", city: "bordeaux")
user3 = User.create!(email: "ccccc@ccccc.fr",password: "123456", city: "bordeaux")
user4 = User.create!(email: "ddddd@ddddd.fr",password: "123456", city: "paris")
user5 = User.create!(email: "eeeee@eeeee.fr",password: "123456", city: "paris")
puts "Some users have been created"
puts "Creating new games..."
game1 = Game.create!(name: "Poker", category: "Jeu de Carte", description: "Un jeux où il faut miser", min_player: 2, max_player: 16)
game2 = Game.create!(name: "Monopoly", category: "Plateau", description: "Un jeux où il faut plumer tes adversaires", min_player: 2, max_player: 8)
game3 = Game.create!(name: "Risk", category: "Plateau", description: "Pars à la conquete du monde", min_player: 2, max_player: 6)
game4 = Game.create!(name: "La bonne paye", category: "Plateau", description: "Paye, paye, paye... ou deviens riche", min_player: 2, max_player: 6)
game5 = Game.create!(name: "Tarot", category: "Jeu de Carte", description: "Une legende de jeu de carte", min_player: 3, max_player: 5)
puts "Some games have been created"
puts "Creating new game sessions..."
GameSession.create!(game: game1, creator: user1, date: Time.now + (2*7*24*60*60), price: 10)
GameSession.create!(game: game1, creator: user1, date: Time.now + (1.9*7*24*60*60), price: 15)
GameSession.create!(game: game2, creator: user1, date: Time.now + (2*7*24*60*60), price: 12)
GameSession.create!(game: game3, creator: user2, date: Time.now + (1.8*7*24*60*60), price: 25)
GameSession.create!(game: game4, creator: user2, date: Time.now + (2.1*7*24*60*60), price: 30)
GameSession.create!(game: game3, creator: user2, date: Time.now + (2.3*7*24*60*60), price: 25)
GameSession.create!(game: game4, creator: user2, date: Time.now + (2*7*24*60*60), price: 30)
GameSession.create!(game: game2, creator: user3, date: Time.now + (1.7*7*24*60*60), price: 20)
GameSession.create!(game: game5, creator: user3, date: Time.now + (2.1*7*24*60*60), price: 7)
GameSession.create!(game: game5, creator: user4, date: Time.now + (2*7*24*60*60), price: 5)
GameSession.create!(game: game4, creator: user5, date: Time.now + (2*7*24*60*60), price: 6)
puts "Some game sessions have been created"
puts "Congratulation, your database is clean and has some elements from the seed"
