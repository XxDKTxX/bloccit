require 'rails_helper'
include RandomData

RSpec.describe AdvertisementController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  it "assigns [my_ad] to @advertisements" do
    get :index
    expect(assigns(:advertisements)).to eq([my_ad])

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view"
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_ad to @advertisement" do
       get :show, {id: my_ad.id}
       expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response). to render_template :new
    end
    
    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to_be_nil
    end
  end

  describe "ADVErtisement create" do
    it "increases the number of advertisements by 1" do
      expect{advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}}.to
      change(Advertisement,:count).by(1)
    end
    
    it "assigns the new advertisement to @advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end
    
    it "redirects to the new advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(responce).to redirect_to Advertisement.last
    end
  end
end
