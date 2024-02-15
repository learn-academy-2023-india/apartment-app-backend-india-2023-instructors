require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do 
    apartment = user.apartments.create(
      unit: "20",
      city: "Sesame",
      state: "ISLE",
      square_footage: 2000,
      price: 1500,
      bedrooms: 5,
      bathrooms: 3,
      pets: "puppets only",
      image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg"
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate user_id' do 
    apartment = Apartment.create(
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
    )
    expect(apartment.errors[:user_id]).to include("can't be blank")
  end
end
