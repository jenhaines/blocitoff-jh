require 'rails_helper'

RSpec.describe Todo, :type => :model do
  it "requires the description to be present" do
  	expect( subject.valid? ).to eql false
    subject.description = "eat your greens"
    expect( subject.valid? ).to eql true    
  end
end
