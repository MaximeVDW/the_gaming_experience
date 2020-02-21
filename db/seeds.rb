require "open-uri"

puts "Destroying the old database"
User.destroy_all
Game.destroy_all
GameSession.destroy_all
puts "All the old database has been deleted"
puts "Creating new users..."
user1 = User.new(email: "aaaaa@aaaaa.fr", password: "123456", phone_number: "0691235671", postal_code: "33000", street_number: "5", street: "Rue Prunier", first_name: "Alexis", last_name: "Filia", username: "Alex", city: "bordeaux")
picture1 = URI.open('https://images.unsplash.com/photo-1574257434424-2ee5b4fa8922?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80')
user1.photo.attach(io: picture1, filename: 'user1.jpg', content_type: 'image/png')
user1.save!

user2 = User.new(email: "bbbbb@bbbbb.fr", password: "123456", phone_number: "0691235672", postal_code: "33000", street_number: "18", street: "Avenue du Général Foch", first_name: "Tim", last_name: "Boing", username: "TimTim", city: "bordeaux")
picture2 = URI.open('https://images.unsplash.com/photo-1517423738875-5ce310acd3da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=705&q=80')
user2.photo.attach(io: picture2, filename: 'user2.png', content_type: 'image/png')
user2.save!

user3 = User.new(email: "ccccc@ccccc.fr", password: "123456", phone_number: "0691235673", postal_code: "33300", street_number: "32", street: "Sente des Moritiers", first_name: "Geoffrey", last_name: "Dulac", username: "GeoffreyXXX", city: "bordeaux")
picture3 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582122066/mec1_fazdks.jpg')
user3.photo.attach(io: picture3, filename: 'user3.png', content_type: 'image/png')
user3.save!

user4 = User.new(email: "ddddd@ddddd.fr", password: "123456", phone_number: "0691235674", postal_code: "75000", street_number: "12", street: "cours balguerie stuttenberg", first_name: "VanderWees", last_name: "Maxime", username: "Max", city: "paris")
picture4 = URI.open('https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
user4.photo.attach(io: picture4, filename: 'user4.png', content_type: 'image/png')
user4.save!

user5 = User.new(email: "eeeee@eeeee.fr", password: "123456", phone_number: "0691235675", postal_code: "75000", street_number: "8", street: "Inconnu", first_name: "Bobby", last_name: "Lapointe", username: "Bob", city: "paris")
picture5 = URI.open('https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&auto=format&fit=crop&w=660&q=80')
user5.photo.attach(io: picture5, filename: 'user5.png', content_type: 'image/png')
user5.save!

puts "Some users have been created"
puts "Creating new games..."
game1 = Game.new(name: "Poker", category: "Jeu de Carte", description: "Poker is a family of card games that combines gambling, strategy and different skills. All poker variants involve betting as an intrinsic part of play, and determine the winner of each hand according to the combinations of players' cards, at least some of which remain hidden until the end of the hand.", min_player: 2, max_player: 16)
picture6 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582121428/soTTbeKprrFzz2NHB3X7kwKs.jpg')
game1.photo.attach(io: picture6, filename: 'poker.png', content_type: 'image/png')
game1.save

game2 = Game.new(name: "Monopoly", category: "Plateau", description: "Monopoly is a board game currently published by Hasbro. In the game, players roll two six-sided dice to move around the game board, buying and trading properties, and developing them with houses and hotels. Players collect rent from their opponents, with the goal being to drive them into bankruptcy.", min_player: 2, max_player: 8)
picture7 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582121801/monopoly_hdnh8q.jpg')
game2.photo.attach(io: picture7, filename: 'monopoly.png', content_type: 'image/png')
game2.save

game3 = Game.new(name: "Risk", category: "Plateau", description: "Risk is a strategy board game of diplomacy, conflict and conquest[1] for two to six players. The standard version is played on a board depicting a political map of Earth, divided into forty-two territories, which are grouped into six continents.", min_player: 2, max_player: 6)
picture8 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582045733/risk_i5wr26.jpg')
game3.photo.attach(io: picture8, filename: 'risk.png', content_type: 'image/png')
game3.save

game4 = Game.new(name: "La bonne paye", category: "Plateau", description: "Les joueurs jettent un dé à tour de rôle pour se déplacer sur le parcours. En fonction de la case où ils tombent, ils doivent tirer une carte, payer ou recevoir de l'argent.", min_player: 2, max_player: 6)
picture9 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582121801/bonne_paye_crwqxh.jpg')
game4.photo.attach(io: picture9, filename: 'labonnepaye.png', content_type: 'image/png')
game4.save

game5 = Game.new(name: "Tarot", category: "Jeu de Carte", description: "The French game of tarot, also jeu de tarot, is a trick-taking strategy tarot card game played by three to five players using a traditional 78-card tarot deck. The game is the second most popular card game in France.", min_player: 3, max_player: 5)
picture10 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582121802/tarot_sxzdlq.jpg')
game5.photo.attach(io: picture10, filename: 'tarot.png', content_type: 'image/png')
game5.save

puts "Some games have been created"
puts "Creating new game sessions..."
GameSession.create!(game: game1, creator: user1, city: "Bordeaux", description: "Y aura du sexe aussi!", date: Time.now + (2*7*24*60*60), price: 10, address: '1 Quai de Bacalan, 33300 Bordeaux')
GameSession.create!(game: game1, creator: user1, city: "Bordeaux", description: "I'm feeling alone tonight please come fill my hole...", date: Time.now + (1.9*7*24*60*60), price: 15, address: '50 Rue du Hâ, 33000 Bordeaux')
GameSession.create!(game: game2, creator: user1, city: "Bordeaux", description: "I'm the tarot king, don't try me, I'm invincible!!!", date: Time.now + (2*7*24*60*60), price: 12, address: '10 Rue des Bahutiers, 33000 Bordeaux')
GameSession.create!(game: game3, creator: user2, city: "Bordeaux", description: "What is this fucking app, I cannot even order something to eat!", date: Time.now + (1.8*7*24*60*60), price: 25, address: '16 Place des Quinconces, 33000 Bordeaux')
GameSession.create!(game: game4, creator: user2, city: "Paris", description: "Where do I book a flat? I have lost my way in the net...", date: Time.now + (2.1*7*24*60*60), price: 30, address: '16 Villa Gaudelet, Paris')
GameSession.create!(game: game3, creator: user2, city: "Paris", description: "App de merde!! ou eskon va chercher ses vices?", date: Time.now + (2.3*7*24*60*60), price: 25, address: '12 Villa Gaudelet, Paris')
GameSession.create!(game: game4, creator: user2, city: "Bordeaux", description: "Where is my spaceship? I can't find my cruiser, shitty planet!", date: Time.now + (2*7*24*60*60), price: 30)
GameSession.create!(game: game2, creator: user3, city: "Bordeaux", description: "I have a whole day to lose, let's play risk! Come at me with all you've got!", date: Time.now + (1.7*7*24*60*60), price: 20)
GameSession.create!(game: game5, creator: user3, city: "Bordeaux", description: "Hope to have a happy ending to this wonderful night.", date: Time.now + (2.1*7*24*60*60), price: 7)
GameSession.create!(game: game5, creator: user4, city: "Paris", description: "I don't know how to play, please come to show me...", date: Time.now + (2*7*24*60*60), price: 5, address: '26 Villa Gaudelet, Paris')
GameSession.create!(game: game4, creator: user5, city: "Bordeaux", description: "Don't come to make friends, we're gonna play monopoly. I have a cam pointed at the bank for tricksters.", date: Time.now + (2*7*24*60*60), price: 6)

GameSession.create!(game: game5, creator: user2, booked: true, player: user1, city: "Paris", description: "I'm feeling alone tonight please come fill my hole...", date: Time.now + (1*7*24*60*60), price: 100)
GameSession.create!(game: game5, creator: user3, booked: true, player: user1, city: "Bordeaux", description: "I'm the tarot king, don't try me, I'm invincible!!!", date: Time.now + (1.5*7*24*60*60), price: 1)
GameSession.create!(game: game4, creator: user4, booked: true, player: user1, city: "Bordeaux", description: "What is this fucking app, I cannot even order something to eat!", date: Time.now + (2.6*7*24*60*60), price: 11)
GameSession.create!(game: game4, creator: user1, booked: true, player: user2, city: "Paris", description: "Where do I book a flat? I have lost my way in the net...", date: Time.now + (1.4*7*24*60*60), price: 29)
GameSession.create!(game: game4, creator: user1, booked: true, player: user2, city: "Bordeaux", description: "Where is my spaceship? I can't find my cruiser, shitty planet!", date: Time.now + (2.2*7*24*60*60), price: 34)
GameSession.create!(game: game4, creator: user3, booked: true, player: user2, city: "Bordeaux", description: "I have a whole day to lose, let's play risk! Come at me with all you've got!", date: Time.now + (2.8*7*24*60*60), price: 28)
GameSession.create!(game: game4, creator: user2, booked: true, player: user3, city: "Paris", description: "Hope to have a happy ending to this wonderful night.", date: Time.now + (2.1*7*24*60*60), price: 23)
GameSession.create!(game: game2, creator: user4, booked: true, player: user3, city: "Bordeaux", description: "I don't know how to play, please come to show me...", date: Time.now + (1.6*7*24*60*60), price: 21)
GameSession.create!(game: game2, creator: user3, booked: true, player: user4, city: "Paris", description: "Don't come to make friends, we're gonna play monopoly. I have a cam pointed at the bank for tricksters.", date: Time.now + (2.6*7*24*60*60), price: 9)
GameSession.create!(game: game1, creator: user4, booked: true, player: user5, city: "Bordeaux", description: "App de merde!! ou eskon va chercher ses vices?", date: Time.now + (2.3*7*24*60*60), price: 3)
GameSession.create!(game: game1, creator: user1, booked: true, player: user5, city: "Bordeaux", description: "Hello? Is somebody there? Contact does not work, I have sent 47 emails...", date: Time.now + (3*7*24*60*60), price: 2)
puts "Some game sessions have been created"
puts "Congratulation, your database is clean and has some elements from the seed"

