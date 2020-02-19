puts "Destroying the old database"
User.destroy_all
Game.destroy_all
GameSession.destroy_all
puts "All the old database has been deleted"
puts "Creating new users..."
user1 = User.create!(email: "aaaaa@aaaaa.fr",password: "123456", city: "bordeaux")
user2 = User.create!(email: "bbbbb@bbbbb.fr",password: "123456", city: "bordeaux")
user3 = User.create!(email: "ccccc@ccccc.fr",password: "123456", city: "bordeaux")
user4 = User.create!(email: "ddddd@ddddd.fr",password: "123456", city: "paris")
user5 = User.create!(email: "eeeee@eeeee.fr",password: "123456", city: "paris")
puts "Some users have been created"
puts "Creating new games..."
game1 = Game.create!(name: "Poker", category: "Jeu de Carte", description: "Poker is a family of card games that combines gambling, strategy and different skills. All poker variants involve betting as an intrinsic part of play, and determine the winner of each hand according to the combinations of players' cards, at least some of which remain hidden until the end of the hand.", min_player: 2, max_player: 16)
game2 = Game.create!(name: "Monopoly", category: "Plateau", description: "Monopoly is a board game currently published by Hasbro. In the game, players roll two six-sided dice to move around the game board, buying and trading properties, and developing them with houses and hotels. Players collect rent from their opponents, with the goal being to drive them into bankruptcy.", min_player: 2, max_player: 8)
game3 = Game.create!(name: "Risk", category: "Plateau", description: "Risk is a strategy board game of diplomacy, conflict and conquest[1] for two to six players. The standard version is played on a board depicting a political map of Earth, divided into forty-two territories, which are grouped into six continents.", min_player: 2, max_player: 6)
game4 = Game.create!(name: "La bonne paye", category: "Plateau", description: "Les joueurs jettent un dé à tour de rôle pour se déplacer sur le parcours. En fonction de la case où ils tombent, ils doivent tirer une carte, payer ou recevoir de l'argent.", min_player: 2, max_player: 6)
game5 = Game.create!(name: "Tarot", category: "Jeu de Carte", description: "The French game of tarot, also jeu de tarot, is a trick-taking strategy tarot card game played by three to five players using a traditional 78-card tarot deck. The game is the second most popular card game in France.", min_player: 3, max_player: 5)
puts "Some games have been created"
puts "Creating new game sessions..."
GameSession.create!(game: game1, creator: user1, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2*7*24*60*60), price: 10)
GameSession.create!(game: game1, creator: user1, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (1.9*7*24*60*60), price: 15)
GameSession.create!(game: game2, creator: user1, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2*7*24*60*60), price: 12)
GameSession.create!(game: game3, creator: user2, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (1.8*7*24*60*60), price: 25)
GameSession.create!(game: game4, creator: user2, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (2.1*7*24*60*60), price: 30)
GameSession.create!(game: game3, creator: user2, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (2.3*7*24*60*60), price: 25)
GameSession.create!(game: game4, creator: user2, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2*7*24*60*60), price: 30)
GameSession.create!(game: game2, creator: user3, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (1.7*7*24*60*60), price: 20)
GameSession.create!(game: game5, creator: user3, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2.1*7*24*60*60), price: 7)
GameSession.create!(game: game5, creator: user4, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (2*7*24*60*60), price: 5)
GameSession.create!(game: game4, creator: user5, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2*7*24*60*60), price: 6)

GameSession.create!(game: game5, creator: user2, player: user1, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (1*7*24*60*60), price: 100)
GameSession.create!(game: game5, creator: user3, player: user1, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (1.5*7*24*60*60), price: 1)
GameSession.create!(game: game4, creator: user4, player: user1, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2.6*7*24*60*60), price: 11)
GameSession.create!(game: game4, creator: user1, player: user2, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (1.4*7*24*60*60), price: 29)
GameSession.create!(game: game4, creator: user1, player: user2, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2.2*7*24*60*60), price: 34)
GameSession.create!(game: game4, creator: user3, player: user2, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2.8*7*24*60*60), price: 28)
GameSession.create!(game: game4, creator: user2, player: user3, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (2.1*7*24*60*60), price: 23)
GameSession.create!(game: game2, creator: user4, player: user3, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (1.6*7*24*60*60), price: 21)
GameSession.create!(game: game2, creator: user3, player: user4, city: "Paris", description: "Balblablalbalalallalalalal", date: Time.now + (2.6*7*24*60*60), price: 9)
GameSession.create!(game: game1, creator: user4, player: user5, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (2.3*7*24*60*60), price: 3)
GameSession.create!(game: game1, creator: user1, player: user5, city: "Bordeaux", description: "Balblablalbalalallalalalal", date: Time.now + (3*7*24*60*60), price: 2)
puts "Some game sessions have been created"
puts "Congratulation, your database is clean and has some elements from the seed"
