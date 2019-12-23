require 'rails_helper'

RSpec.describe AvailableRanksController, type: :controller do
  before(:each) do
    @availableRank = AvailableRank.create(name: "White", order: 1, rankType: "standard")
  end

  describe "GET available_ranks/" do
    it "assigns @availableRank" do
      get :index
      expect(@availableRank.name).to eq("White")
    end

    it "render index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET avaialble_ranks/:id" do
    it "render show template" do
      get :show, params: { id: @availableRank.id }
      expect(response).to render_template(:show)
    end

    it "renders correct data" do
      get :show, params: { id: @availableRank.id }
      expect(@availableRank.name).to eq("White")
    end
  end

  describe "GET available_ranks" do
    it "render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST available_ranks/:id" do
    it "creates new available rank" do
      post :create, params: { available_rank: { name: "White", order: 1, rankType: "standard" }}
      expect(response).to redirect_to AvailableRank.last
    end
  end

  describe "PUT available_ranks/:id" do
    it "render edit template" do
      get :edit, params: { id: @availableRank.id }
      expect(response).to render_template(:edit)
    end

    it "successfully editing record" do
      put :update, params: { id: @availableRank.id, available_rank: { name: "orange", order: 1, rankType: "standard" }}
      @availableRank.reload
      expect(@availableRank.name).to eq("orange")
    end

    it "render form if update was not successful" do
      put :update, params: { id: @availableRank.id, available_rank: { name: "", order: 1, rankType: "standard"}}
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE available_ranks/:id" do
    it "deletes record" do 
      delete :destroy, params: { id: @availableRank.id }
      expect(response).to redirect_to available_ranks_path
    end
  end
end
