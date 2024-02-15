require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of apartments' do 
      apartment = user.apartments.create(
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

      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(apartment.first['street']).to eq("ABC Sesame Street")
      expect(response).to have_http_status(200)
    end
  end

  it 'creates a new apartment' do 
    apartment_params = {
      apartment: {
        street: "ABC Sesame Street",
        unit: "20",
        city: "Sesame",
        state: "ISLE",
        square_footage: 2000,
        price: 1500,
        bedrooms: 5,
        bathrooms: 3,
        pets: "puppets only",
        image: "https://upload.wikimedia.org/wikipedia/commons/0/00/Sesame_Street_buildings_%28193090534%29.jpg",
        user_id: user.id
      }
    }
    post '/apartments', params: apartment_params

    expect(response).to have_http_status(200)
    apartment = Apartment.first 
    expect(apartment['street']).to eq("ABC Sesame Street")
  end
end
