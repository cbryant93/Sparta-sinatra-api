require "spec_helper"

describe Beerio do

  context 'Requesting single Beer information' do

  before(:all) do
    @beerio = Beerio.new
    @response = @beerio.single_beer_service.single_beer_response(1)
  end

  it "Beer id is an Integer" do
    expect(@response.first['id']).to be_a(Integer)
  end

end

context 'Requesting all Beer information' do

before(:all) do
  @beerio = Beerio.new
  @allresponse = @beerio.all_beers_service.all_beers_response
end

it "Beer id is an Integer" do
   @allresponse.each do |key, array|
     p key['name']
    end
end

end

end
