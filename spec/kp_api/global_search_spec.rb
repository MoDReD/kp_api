require 'spec_helper'

describe KpApi::GlobalSearch do
  gs1 = KpApi::GlobalSearch.new('Бразилия')
  gs2 = KpApi::GlobalSearch.new('Привет')
  gs3 = KpApi::GlobalSearch.new('олимркмрумщшрушосрволыдсродлрфдлоыврцлдоув')


  it "Check return GlobalSearch not formatted data" do
    expect( gs1.data.class     ).to eql(Hash)
    expect( gs1.data['class'] ).to eql("KPGlobalSearch")
    expect( gs1.data['keyword'] ).to eql("Бразилия")
    expect( gs1.data['searchFilms'].count ).to eql(3)
    expect( gs1.data['searchPeople'].count > 0).to eql(true)
    expect( gs1.data['searchFilmsCountResult'] > 0).to eql(true)
    expect( gs1.data['searchPeoplesCountResult'] > 0).to eql(true)

    expect( gs2.data.class     ).to eql(Hash)
    expect( gs2.data['class'] ).to eql("KPGlobalSearch")
    expect( gs2.data['keyword'] ).to eql("Привет")
    expect( gs2.data['searchFilms'].count ).to eql(3)
    expect( gs2.data['searchPeople'] ).to eql(nil)
    expect( gs2.data['searchFilmsCountResult'] > 0).to eql(true)
    expect( gs2.data['searchPeoplesCountResult']).to eql(nil)

    expect( gs3.data.class     ).to eql(Hash)
    expect( gs3.data['class'] ).to eql("KPGlobalSearch")
    expect( gs3.data['keyword'] ).to eql("олимркмрумщшрушосрволыдсродлрфдлоыврцлдоув")
    expect( gs3.data['searchFilms'] ).to eql([])
    expect( gs3.data['searchFilmsCountResult']).to eql(nil)
    expect( gs3.data['searchPeoplesCountResult']).to eql(nil)

  end

  it "Check return GlobalSearch formatted data \"Бразилия\"" do
    expect( gs1.found?            ).to eql(true)
    expect( gs1.films_count > 40  ).to eql(true)
    expect( gs1.peoples_count > 0 ).to eql(true)

    expect( gs1.films.count   == 3 ).to eql(true)
    expect( gs1.peoples.count > 0  ).to eql(true)

    expect( gs1.films.first.class ).to eql(Hash)
    expect( gs1.films.first[:id] > 0).to eql(true)

    expect( gs1.peoples.first.class ).to eql(Hash)
    expect( gs1.peoples.first[:id] > 0).to eql(true)

    expect( gs1.youmean.class ).to eql(Hash)
    expect( gs1.youmean[:id] > 0).to eql(true)

  end

  it "Check return GlobalSearch formatted data \"Привет\"" do
    expect( gs2.found?             ).to eql(true)
    expect( gs2.films_count > 100  ).to eql(true)
    expect( gs2.peoples_count == 0 ).to eql(true)

    expect( gs2.films.count   == 3 ).to eql(true)
    expect( gs2.peoples            ).to eql(nil)

    expect( gs2.films.first.class ).to eql(Hash)
    expect( gs2.films.first[:id] > 0).to eql(true)

  end

  it "Check return GlobalSearch formatted not found data"  do
    expect( gs3.found? ).to eql(false)
  end


end