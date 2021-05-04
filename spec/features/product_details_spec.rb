require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP 
  before :each do 
    @category = Category.create! name: 'Apparel'
    2.times do  |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on a product and it goes to the product page" do
    # ACT
    visit root_path

    #  puts   page.find('article.product', match: :first).all('a')[1].text
    page.find('article.product', match: :first).click_link("Detail", :text => "Detail")
    # DEBUG / VERIFY
    save_screenshot
    # expect(page).to have_css 'products-show'
  end
end
