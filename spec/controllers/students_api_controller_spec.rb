require 'rails_helper'
require 'v1/students_controller'

RSpec.describe V1::StudentsController, type: :controller do
  before(:each) do
    User.create!(:email => 'test1@gmail.com', :password => 'password')
    @student = Student.create!(firstName: "Chuck", lastName: "Norris", user_id: User.first.id)
  end

  it "GET v1/students returns success status" do
    get :index, params: { id: 1 }
    expect(response).to have_http_status(:success)
  end

  it "GET v1/students returns content" do
    get :index, params: { id: User.first.id }
    json_response = JSON.parse(response.body)
    expect(json_response.length).to be(1)
    expect(json_response[0]['firstName']).to eq('Chuck')
  end
end