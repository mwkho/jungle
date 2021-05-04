require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP 
  before :each do 
    @category = Category.create! name: 'Apparel'
    5.times do  |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 3,
        price: 64.99
      )
    end
  end

  scenario 'When you add an item, the cart item turns to 1' do
    visit root_path
    page.find('article.product', match: :first).click_button("Add")

    expect(page).to have_content("My Cart (1)")  
  end
end
