require "open-uri"

Booking.destroy_all
Broom.destroy_all
User.destroy_all

test_user = User.create(email: "test@test.test", password: "1234567")

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/5/5b/%C3%89clair_de_Feu.png/revision/latest?cb=20130710170720&path-prefix=fr")
broom = Broom.new(user: test_user, name: "Nimbus 6000", description: "super balais", price: "1200", address: "54 Avenue de Gleyze Vieille, Ramonville Saint Agne")
broom.photo.attach(io: file, filename: "eclairdefeu.png", content_type: "image/png")
broom.save!
