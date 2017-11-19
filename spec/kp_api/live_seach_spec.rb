require 'spec_helper'

describe KpApi::LiveSearch do
  gs1 = KpApi::LiveSearch.new('Бра')
  gs2 = KpApi::LiveSearch.new('олимркмрумщшрушосрволыдсродлрфдлоыврцлдоув') #;)

  it "Check return LiveSearch not formatted data" do
    expect( gs1.data.class     ).to eql(Hash)
    expect( gs1.data['class'] ).to eql("KPLiveSearch")
    expect( gs1.data['items'].class ).to eql(Array)
    expect( gs1.data['items'].count > 0).to eql(true)

    expect( gs2.data.class     ).to eql(Hash)
    expect( gs2.data['class'] ).to eql("KPLiveSearch")
    expect( gs2.data['items'] ).to eql(nil)
  end

  it "Check return LiveSearch formatted data \"Бра\"" do
    expect( gs1.found?            ).to eql(true)
    expect( gs1.items.class       ).to eql(Array)
    expect( gs1.items.count   > 3 ).to eql(true)
  end

  it "Check return LiveSearch formatted not found data"  do
    expect( gs2.found? ).to eql(false)
  end


end