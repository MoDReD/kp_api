require 'spec_helper'

describe KpApi::People do
  id = 1
  r  = KpApi::People.new(id)

  it "Check return Film not formatted data" do
    expect( r.data.class  ).to eql(Hash)
    expect( r.status      ).to eql(true)

    expect( r.data['class']        ).to eql("KPPeopleDetailView")
    expect( r.data['peopleID']     ).to eql("1")
    expect( r.data['webURL']       ).to eql("http://www.kinopoisk.ru/name/1/")
    expect( r.data['nameRU']       ).to eql("Стивен Карпентер")
    expect( r.data['nameEN']       ).to eql("Stephen Carpenter")
    expect( r.data['sex']          ).to eql("male")
    expect( r.data['birthplace']   ).to eql("Уэтерфорд, Техас, США")
  end

  it "Check return Film formatted data" do
    expect( r.view[:kp_type]     ).to eql("KPPeopleDetailView")
    expect( r.view[:id]          ).to eql(1)
    expect( r.view[:name_ru]     ).to eql("Стивен Карпентер")
    expect( r.view[:name_en]     ).to eql("Stephen Carpenter")
    expect( r.view[:sex]         ).to eql("male")
    expect( r.view[:profession]  ).to eql(["Сценарист", "Режиссер", "Оператор"])
    expect( r.view[:birthplace]  ).to eql("Уэтерфорд, Техас, США")
  end

  it "Check return People films data" do
    expect( r.films.count > 21              ).to eql(true)
    expect( r.films.first[:id].class        ).to eql(Integer)
    expect( r.film_ids.map{|i| i.class == Integer && i > 0 }.uniq). to eql([true])
  end

  it "Check return not found Film" do
    expect { KpApi::People.new(999999999999999999999999) }
      .to raise_error(KpApi::ApiError)
  end

end