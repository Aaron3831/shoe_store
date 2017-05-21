require("spec_helper")


describe(Shoe) do
  it("validates presence of brand") do
    shoe = Shoe.new({:brand => ""})
    expect(shoe.save()).to(eq(false))
  end
  it("assures that a shoe brand entry is unique in the database") do
    shoe1 = Shoe.create({:brand => "Nike"})
    shoe2 = Shoe.new({:brand => "Nike"})
    expect(shoe2.save()).to(eq(false))
  end
  it("ensures the length of the shoe brand is no more than 100 characters") do
    shoe = Shoe.new({:brand => "a".*(101)})
    expect(shoe.save()).to(eq(false))
  end
    it("Capitalizes the first letter of every word in a shoe brand") do
      shoe = Shoe.create({:brand => "adidas"})

      expect(shoe.brand()).to(eq("Adidas"))
    end

    describe('#stores') do
      it('each shoe can have many stores') do
        shoe = Shoe.create({:brand => "nike"})
        store1 = shoe.stores.create({:title => 'footlocker'})
        store2 = shoe.stores.create({:title => 'payless'})
        expect(shoe.stores()).to(eq([store1, store2]))
      end
    end
end
