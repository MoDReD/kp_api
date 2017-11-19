require 'spec_helper'

describe KpApi::Top do
  top1 = KpApi::Top.new(:popular_films)
  top2 = KpApi::Top.new(:best_films)
  top3 = KpApi::Top.new(:await_films)
  top4 = KpApi::Top.new(:popular_people)


  it "Check return Top not formatted data" do
    expect( top1.data.class     ).to eql(Hash)

    expect( top2.data.class     ).to eql(Hash)

    expect( top3.data.class     ).to eql(Hash)

    expect( top4.data.class     ).to eql(Hash)

  end



end