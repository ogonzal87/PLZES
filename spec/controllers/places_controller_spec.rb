require 'rails_helper'


describe PlacesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user, no_capybara: true }
  let(:place1) { FactoryGirl.create(:place) }
  let(:place2) { FactoryGirl.create(:place) }

# describe PlacesController, type: :controller do
# 	let(:user) { FactoryGirl.create(:user) }
# 	sign_in { user, no_capybara: true }

#   let(:place1) { Place.create(name: 'Chipotle') }
#   let(:place2) { Place.create(name: 'Burrito Palace') }

  describe 'GET #index' do
    it 'renders index' do # loads the page
      get :index
      expect(response).to render_template(:index)
    end

    it 'populate an array of place' do
    	get :index
      expect(assigns(:places)).to eq([place1, place2])
    end
  end

  describe 'GET #new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Place' do
      get :new
      expect(assigns(:place)).to be_a_new(Place)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      let(:valid_attributes) { { name: 'McDonald' } }

      it 'create new place' do
        expect{
          post :create, place: valid_attributes
        }.to change(Place, :count).by(1)
      end

      it 'redirects to items#index' do
        post :create, place: valid_attributes
        expect(response).to redirect_to(places_path)
      end
    end
  end
end
