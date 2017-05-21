require("spec_helper")


describe(Price) do
  it("validates presence of total") do
    price = Price.new({:total => ""})
    expect(price.save()).to(eq(false))
  end
  it("assures that a price total entry is unique in the database") do
    price1 = Price.create({:total => "50"})
    price2 = Price.new({:total => "50"})
    expect(price2.save()).to(eq(false))
  end
  it("ensures the length of the price total is no more than 100 characters") do
    price = Price.new({:total => "50".*(101)})
    expect(price.save()).to(eq(false))
  end

    describe('#prices') do
      it('each price can have many shoes') do
        price = Price.create({:total => "50"})
        shoe1 = price.shoes.create({:brand => 'adidas'})
        shoe2 = price.shoes.create({:brand => 'nike'})
        expect(price.shoes()).to(eq([shoe1, shoe2]))
      end
    end
end
