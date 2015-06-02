require 'capybara/rspec'
require 'restaurant'
require 'customer'

feature 'Takeaway' do

  let(:restaurant) {Restaurant.new}
  let(:customer)   {Customer.new}

  scenario 'display menu with prices' do
    expect(restaurant.menu).to include 'yoghurt'
  end

  scenario 'customer can select dishes from menu' do
    restaurant.select_dish('lasagne')
    expect(restaurant.basket).to eq([{'lasagne' => 10.0}])
  end

  scenario 'Restuarant calculates basket total and shows customer bill' do
    restaurant.select_dish('pizza', 2)
    expect(restaurant.bill_total).to eq(23)
  end

end