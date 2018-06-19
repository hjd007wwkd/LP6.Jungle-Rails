require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "My cart will change from 0 to 1" do
    # ACT
    visit root_path
    product = page.first('div.products article.product')
    product.click_link('Add')
    expect(page).to have_css('#navbar', text: " My Cart (1)")
  end
end
