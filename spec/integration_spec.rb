require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('shoe', {:type => :feature}) do
  it('gets to index properly') do
    visit('/')
    expect(page).to have_content('Shoes!')
  end
  it('process shoe brand page properly') do
    visit('/shoes')
    fill_in("shoe_name", :with => 'nike')
    click_button('Add Shoe')
    expect(page).to have_content('Nike')
  end
end
