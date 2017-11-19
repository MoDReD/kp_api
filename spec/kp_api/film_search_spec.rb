require 'spec_helper'

describe KpApi::FilmSearch do
  gs1 = KpApi::FilmSearch.new('Бразилия')
  gs2 = KpApi::FilmSearch.new('олимркмрумщшрушосрволыдсродлрфдлоыврцлдоув')

  it "Check return FilmSearch not formatted data" do
    expect( gs1.data.class     ).to eql(Hash)
    expect( gs1.data['class'] ).to eql("KPSearchInFilms")
    expect( gs1.data['keyword'] ).to eql("Бразилия")
    expect( gs1.data['searchFilms'].count ).to eql(20)
    expect( gs1.data['searchFilmsCountResult'] > 40).to eql(true)
    expect( gs1.data['pagesCount'] > 2).to eql(true)

    expect( gs2.data.class     ).to eql(Hash)
    expect( gs2.data['class'] ).to eql("KPSearchInFilms")
    expect( gs2.data['keyword'] ).to eql("олимркмрумщшрушосрволыдсродлрфдлоыврцлдоув")
    expect( gs2.data['pagesCount'] ).to eql(0)
  end

  it "Check return FilmSearch formatted data \"Бразилия\" and paginate" do
    expect( gs1.found? ).to eql(true)
    expect( gs1.view.count == 20  ).to eql(true)
    expect( gs1.films_count > 40 ).to eql(true)
    expect( gs1.current_page     ).to eql(1)
    expect( gs1.page_count > 2   ).to eql(true)
    f_id = gs1.view.first[:id]

    2.upto( gs1.page_count ).map do |page|
      expect( gs1.next_page ).to eql(true)
      expect( gs1.current_page ).to eql(page)
    end

    expect( gs1.next_page ).to eql(false)
    expect( gs1.view.count > 0  ).to eql(true)
    expect( f_id != gs1.view.first[:id] ).to eql(true)

  end

  it "Check return FilmSearch formatted not found data"  do
    expect( gs2.found? ).to eql(false)
  end

end
