require "takeaway"

describe Takeaway do
  before :each do
    @menu = double
    allow(@menu).to receive(:dish).with("Pizza") { [{ name: "Pizza", price: 10 }] }
  end

  describe '#order' do
    it 'can recieve a single item order' do
      expect(subject.order_dish("Pizza")).to eq @menu.dish("Pizza")
    end

    it 'can recieve a multiple line order' do
      subject.order_dish("Pizza")
      subject.order_dish("Calzone")
      expect(subject.order).to eq [{ name: "Pizza", price: 10 }, { name: "Calzone", price: 11 }]
    end

    it 'can add multiple of a single dish' do
      subject.order_dish(2, "Pizza")
      expect(subject.order).to eq [{ name: "Pizza", price: 10 }, { name: "Pizza", price: 10 }]
    end
  end
  
  describe '#complete_order' do
    it 'completes the order and gets the total price' do
      subject.order_dish("Pizza")
      expect(subject.complete_order).to eq "The total cost is £10"
    end
  end
end

# test taking a single item order

# test taking a multi line order

# test getting the price for an order

# test returning the price for an order

# test dispatching the order - sending text
