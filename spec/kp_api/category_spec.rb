require 'spec_helper'

describe KpApi::Category do
  r = KpApi::Category.new(2)


  it "Check return Category not formatted data" do
    expect( r.data.class                 ).to eql(Hash)
    expect( r.status                     ).to eql(true)
    expect( r.data['genre'  ].class      ).to eql(Array)
    expect( r.data['country'].class      ).to eql(Array)
    expect( r.data['genre'  ].count > 0  ).to eql(true)
    expect( r.data['country'].count > 0  ).to eql(true)

    expect( r.data['country'].first['id'     ].class  ).to eql(String)
    expect( r.data['country'].first['name'   ].class  ).to eql(String)

    expect( r.data['genre'].first['id'     ].class    ).to eql(String)
    expect( r.data['genre'].first['name'   ].class    ).to eql(String)

  end

  it "Check return Category genres formatted data" do
    expect( r.genres.class     ).to eql(Array)
    expect( r.genres.count > 0 ).to eql(true)

    expect( r.genres.first[:id     ].class ).to eql(Integer)
    expect( r.genres.first[:name   ].class ).to eql(String)
  end

  it "Check return Category countries formatted data" do
    expect( r.countries.class     ).to eql(Array)
    expect( r.countries.count > 0 ).to eql(true)

    expect( r.countries.first[:id     ].class ).to eql(Integer)
    expect( r.countries.first[:name   ].class ).to eql(String)
  end

  it "Check  return Category before cities data" do
    expect( r.data2 ).to eql(nil)
  end

  it "Check return Category cities data" do
    expect( r.cities.class ).to eql(Array)
    expect( r.cities.count > 0 ).to eql(true)

    expect( r.cities.first[:id     ].class ).to eql(Integer)
    expect( r.cities.first[:name   ].class ).to eql(String)
  end

  it "Check return not found country_id" do
    expect { KpApi::Category.new(9999999999).cities }
      .to raise_error(KpApi::ApiError)
  end

end