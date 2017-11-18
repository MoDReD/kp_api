require 'spec_helper'

describe KpApi::Film do
  id = 444
  resource = KpApi::Film.new(id)


  it "Check return Film not formatted data" do
    expect( resource.data.class  ).to eql(Hash)
    expect( resource.status      ).to eql(true)

    expect( resource.data['class']      ).to eql("KPFilmDetailView")
    expect( resource.data['type']       ).to eql("KPFilm")
    expect( resource.data['filmID']     ).to eql(444)
    expect( resource.data['webURL']     ).to eql("http://www.kinopoisk.ru/film/444/")
    expect( resource.data['nameRU']     ).to eql("Терминатор 2: Судный день")
    expect( resource.data['nameEN']     ).to eql("Terminator 2: Judgment Day")
    expect( resource.data['filmLength'] ).to eql("2:17")
    expect( resource.data['year']       ).to eql("1991")
  end

  it "Check return Film formatted data" do
    expect( resource.view[:kp_type]     ).to eql("KPFilm")
    expect( resource.view[:id]          ).to eql(444)
    expect( resource.view[:name_ru]     ).to eql("Терминатор 2: Судный день")
    expect( resource.view[:name_en]     ).to eql("Terminator 2: Judgment Day")
    expect( resource.view[:slogan]      ).to eql("Same Make. Same Model. New Mission")
    expect( resource.view[:duration]    ).to eql(137)
    expect( resource.view[:year]        ).to eql(1991)
    expect( resource.view[:countries]   ).to eql(["США", "Франция"])
    expect( resource.view[:genres]      ).to eql(["фантастика", "боевик", "триллер"])
  end



  it "Check return Film peoples data" do
    expect( resource.peoples.count                   ).to eql(7)
    expect( resource.peoples.first.class             ).to eql(Hash)
    expect( resource.peoples.first[:id].class        ).to eql(Integer)
    expect( resource.peoples.first[:name_ru].class   ).to eql(String)
    expect( resource.peoples.first[:name_en].class   ).to eql(String)
  end

  it "Check return Film peoples_full data" do
    expect( resource.data2 ).to eql(nil)
  end

  it "Check return Film peoples_full data" do
    expect( resource.peoples_full.count ).to eql(84)
    expect( resource.data2.class        ).to eql(Hash)
    expect( resource.status2            ).to eql(true)
  end

  it "Check return not found Film" do
    expect { KpApi::Film.new(1) }
      .to raise_error(KpApi::ApiError)
  end

end