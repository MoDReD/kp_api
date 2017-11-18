require 'spec_helper'

describe KpApi::Film do

  it "Check return Film id" do
    id = 444
    resource = KpApi::Film.new(id)
    expect( resource.view[:id] ).to eql(id)
  end



end