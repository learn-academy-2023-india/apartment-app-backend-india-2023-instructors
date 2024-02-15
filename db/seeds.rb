user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
  {
    street: "ABC Sesame Street",
    unit: "20",
    city: "Sesame",
    state: "ISLE",
    square_footage: 2000,
    price: 1500,
    bedrooms: 5,
    bathrooms: 3,
    pets: "puppets only",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
  }
]

user2_apartments = [
  {
    street: "Walaby Way",
    unit: "42",
    city: "Sydney",
    state: "Austrilia",
    square_footage: 2000,
    price: 25000,
    bedrooms: 3,
    bathrooms: 2,
    pets: "fish only",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWBSF2x6QbX697RXfV7WdOtqCxF9glLOlF_37xL7pvvea_bWK8JkWHu1llBVz8k9LmFbY&usqp=CAU"
  }
]


user1_apartments.each do |apartment|
  user1.apartments.create(apartment)
  p "created: #{apartment}"
end

user2_apartments.each do |apartment|
  user2.apartments.create(apartment)
  p "created: #{apartment}"
end