#
# Test With controller spec and rendering views
#
RSpec.describe ProductsController, :type => :controller do
  render_views

  let!(:valid_session) { {} }
  let!(:product) { create(:product) }

  describe "GET #index" do
    it "assigns all products as @products" do
      get :index, {}, valid_session

      expect(assigns(:products)).to eq([product])
    end
  end
end

#
# Test With request spec and testing body response
#
RSpec.describe ProductsController, :type => :request do
  render_views

  let!(:valid_session) { {} }
  let!(:product) { create(:product) }

  describe "GET #index" do
    it "assigns all products as @products" do
      get 'index.json', {}, valid_session

      expect(response.body).to eq([product].to_json)
    end
  end
end

#
# Example with Capybara + RSpec
#
describe "the signin process", :type => :feature do
  before :each do
    User.make(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit '/sessions/new'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Success'
  end
end


