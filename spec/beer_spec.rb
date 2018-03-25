require "spec_helper"


describe Beerio do

  context 'Requesting single Beer information' do

  before(:all) do
    @beerio = Beerio.new.single_beer_service
    @beerio.single_beer_response(1)
  end

  it "Beer id is an Integer" do
    expect(@beerio.beer_id).to be_a(Integer)
  end

  it "Beer name is a String" do
    expect(@beerio.name).to be_a(String)
  end

  it "First brewed date should be 7 characters long" do
    expect(@beerio.first_brewed.length).to eq(7)
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

end

end
