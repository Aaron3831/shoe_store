require("spec_helper")


describe(Store) do
  it("validates presence of title") do
    store = Store.new({:title => ""})
    expect(store.save()).to(eq(false))
  end
  it("assures that a store title entry is unique in the database") do
    store1 = Store.create({:title => "Footlocker"})
    store2 = Store.new({:title => "Footlocker"})
    expect(store2.save()).to(eq(false))
  end
  it("ensures the length of the store title is no more than 100 characters") do
    store = Store.new({:title => "a".*(101)})
    expect(store.save()).to(eq(false))
  end
    it("Capitalizes the first letter of every word in a store title") do
      store = Store.create({:title => "payless"})

      expect(store.title()).to(eq("Payless"))
    end

    describe('#shoes') do
      it('each store can have many shoes') do
        store = Store.create({:title => "Payless"})
        store1 = store.shoes.create({:brand => 'Nike'})
        store2 = store.shoes.create({:brand => 'Adidas'})
        expect(store.shoes()).to(eq([store1, store2]))
      end
    end
end
