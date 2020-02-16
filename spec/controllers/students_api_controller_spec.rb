require 'rails_helper'
require 'v1/students_controller'

RSpec.describe V1::StudentsController, type: :controller do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
    Student.create!(firstName: "Chuck", lastName: "Norris", user_id: User.first.id)
    Student.create!(firstName: "Billy", lastName: "Joe", user_id: User.first.id)

  end

  it "GET v1/students returns success status" do
    get :index, params: { id: 1 }
    expect(response).to have_http_status(:success)
  end

  it "GET v1/students returns content" do
    get :index, params: { id: User.first.id }
    json_response = JSON.parse(response.body)
    expect(json_response.length).to be(2)
    json_response = JSON.parse(response.body)
    expect(json_response[0]['firstName']).to eq('Chuck')
  end

  it "POST v1/students/search" do
    post :search, params: { name: 'Chuck' }
    expect(response).to have_http_status(:success)
  end

  it "POST v1/students/search returns only one results" do
    post :search, params: { name: 'billy' }
    json_response = JSON.parse(response.body)
    expect(json_response.length).to be(1)
    expect(json_response[0]['firstName']).to eq('Billy')
  end
end