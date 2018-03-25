require "spec_helper"


describe Beerio do

  context 'Requesting single Beer information' do

  before(:all) do
    @beerio = Beerio.new.single_beer_service
    @beerio.single_beer_response(1)
  end

  it "Beer id should be 1" do
    expect(@beerio.beer_id).to eq(1)
  end

  it "Beer name is a String" do
    expect(@beerio.name).to be_a(String)
  end

  it "First brewed date should be 09/2007" do
    expect(@beerio.first_brewed).to eq("09/2007")
  end

  it "abv and ibu should be a number" do
    expect(@beerio.abv).not_to be_a(String)
    expect(@beerio.ibu).not_to be_a(String)
  end

  it "name of beer should be buzz" do
    expect(@beerio.name).to eq("Buzz")
  end





end

context 'Requesting all Beer information' do

before(:all) do
  @beerio = Beerio.new
  @allresponse = @beerio.all_beers_service.all_beers_response
end

it "All names are type String" do
   @allresponse.each do |key, array|
      expect(key['name']).to be_a(String)
    end
end

it "All beer ID's are type Integer" do
   @allresponse.each do |key, array|
      expect(key['id']).to be_a(Integer)
    end
end

it "ID number limit is 25" do
   @allresponse.each do |key, array|
      expect(key['id']).to be_between(1,25)
    end
end

it "All Descriptions to be type String " do
   @allresponse.each do |key, array|
      expect(key['description']).to be_a(String)
    end
end

it "All Descriptions must be less than 650 characters " do
   @allresponse.each do |key, array|
      expect(key['description'].length).to be <= 650
    end
end

it "All Data is in an array" do
  expect(@allresponse.class).to eq(Array)
end

it "All liquid units must be metric " do
   @allresponse.each do |key, array|
      expect(key["volume"]['unit']).to eq("liters")
    end

    @allresponse.each do |key, array|
       expect(key["boil_volume"]['unit']).to eq("liters")
     end
end

it "All weight units must be metric" do

   @allresponse.each do |key, value|
      key["ingredients"]["malt"].each do |key, value|
        expect(key["amount"]["unit"]).to eq("kilograms")
      end
    end

    @allresponse.each do |key, value|
       key["ingredients"]["hops"].each do |key, value|
         expect(key["amount"]["unit"]).to eq("grams")
       end
     end
end

it "All temperatures should be in celsius" do

   @allresponse.each do |key, value|
     expect(key["method"]["mash_temp"][0]["temp"]["unit"]).to eq("celsius")
    end

    @allresponse.each do |key, value|
      expect(key["method"]["fermentation"]["temp"]["unit"]).to eq("celsius")
     end
end

it "All measurement values should be a number" do

   @allresponse.each do |key, value|
      key["ingredients"]["malt"].each do |key, value|
        expect(key["amount"]["value"]).not_to be_a(String)
      end
    end

    @allresponse.each do |key, value|
       key["ingredients"]["hops"].each do |key, value|
         expect(key["amount"]["value"]).not_to be_a(String)
       end
     end

     @allresponse.each do |key, value|
       expect(key["method"]["mash_temp"][0]["temp"]["value"]).not_to be_a(String)
      end

     @allresponse.each do |key, value|
        expect(key["method"]["fermentation"]["temp"]["value"]).not_to be_a(String)
      end
end

it "All Beers must have an Image" do
   @allresponse.each do |key, array|
      expect(key['image_url']).to be_truthy
    end
end

it "All Beers should have maximum 4 food pairings" do
   @allresponse.each do |key, array|
      expect(key['food_pairing'].length).to be_between(1,4)
    end
end

it "All flavours must be either an Aroma, Bitter or a Flavour " do

    @allresponse.each do |key, value|
      arr = []
       key["ingredients"]["hops"].each do |key, value|
        arr << key["attribute"]
        expect(arr).to  include(key["attribute"])
       end
     end
end

it "All dates should be 7 characters long" do
  @allresponse.each do |key, array|
     expect(key['first_brewed'].length).to eq(7)
   end
end

it "All beers should have a tagline" do
  @allresponse.each do |key, array|
     expect(key['tagline']).to be_truthy
   end
end
end

end
