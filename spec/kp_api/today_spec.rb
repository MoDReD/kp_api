require 'spec_helper'

describe KpApi::Today do
  r = KpApi::Today.new()

  it "Check return Today not formatted data" do
    expect( r.data.class                 ).to eql(Hash)
    expect( r.status                     ).to eql(true)

    expect( r.data['class'  ]              ).to eql('KPTodayFilms')
    expect( r.data['filmsData'].class      ).to eql(Array)
    expect( r.data['filmsData'].count  > 0 ).to eql(true)

    expect( r.data['filmsData'].first['id'       ].class    ).to eql(String)
    expect( r.data['filmsData'].first['nameRU'   ].class    ).to eql(String)
    expect( r.data['filmsData'].first['nameEN'   ].class    ).to eql(String)
  end

  it "Check return Today formatted data" do
    expect( r.view.class     ).to eql(Array)
    expect( r.view.count > 0 ).to eql(true)

    expect( r.view.first[:id     ].class ).to eql(Integer)
    expect( r.view.first[:name_ru].class ).to eql(String)
    expect( r.view.first[:name_en].class ).to eql(String)
  end

  it "Check return Today ids formatted data" do
    expect( r.film_ids.count > 0    ).to eql(true)
    expect( r.film_ids.first.class  ).to eql(Integer)
    expect( r.film_ids.map{|i| i.class == Integer && i > 0 }.uniq). to eql([true])
  end

  it "Check return Today not found country_id" do
    expect( KpApi::Today.new(9999999999, 99999999999).view ).to eql([])
  end

end