require "open-uri"

Booking.destroy_all
Broom.destroy_all
User.destroy_all

user1 = User.create(email: "test@test.en", password: "1234567")
user2 = User.create(email: "test@test_test.en", password: "123123")

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/7/74/Firebolt.jpg/revision/latest?cb=20141122220040")
broom2 = Broom.new(name: "Flying Lightning", description: "The fastest broom I got to ride", address: "120 The Causeway, Quedgeley, Gloucester GL2 4LH, United Kingdoms", price: 420, user: user1)
broom2.photo.attach(io: file, filename: "broom2.png", content_type: "image/png")
broom2.save!

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/e/ec/Fl%C3%A8che_d%27Argent.jpg/revision/latest?cb=20230221093725&path-prefix=fr")
broom3 = Broom.new(name: "Silver Arrow", description: "An old but steady model, will never let you down", address: "Wolsey House, Sproughton Rd, Ipswich IP1 5AN, Reino Unido", price: 155, user: user1)
broom3.photo.attach(io: file, filename: "broom3.png", content_type: "image/png")
broom3.save!

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/3/35/Nimbus_1700_%28HPSP%29.png/revision/latest?cb=20240224171559&path-prefix=fr")
broom4 = Broom.new(name: "Nimbus 1700", description: "This broom will lead you through fame and victory", address: "Westwood Industrial Estate, Westwood, Margate CT9 4JX, Reino Unido", price: 280, user: user1)
broom4.photo.attach(io: file, filename: "broom4.png", content_type: "image/png")
broom4.save!

file = URI.open("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.fnac.com%2Fmp14876495%2FReplique-Harry-Potter-1-1-Balai-magique-Nimbus-2001%2Fw-4&psig=AOvVaw1_t0uqTgBA8aAO5FEfgU0T&ust=1720878274156000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPiPqaTRoYcDFQAAAAAdAAAAABAE")
broom5 = Broom.new(name: "Nimbus 2001", description: "The fastest model ever made, you can flee from both dragons and lightnings and reach the stars in no time!", address: "Latymer Secondary School, Haselbury Rd, London N9 9TN, Reino Unido",  price: 500, user: user1)
broom5.photo.attach(io: file, filename: "eclairdefeu.png", content_type: "image/png")
broom5.save!
