require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see all product details" do
    # ACT
    visit root_path
    # first element matching in the page, article element with class name product inside of div with classname products
    product = page.first('div.products article.product')
    product.click_link('Details')

    expect(page).to have_css 'section.products-show article.product-detail'
  end

end
