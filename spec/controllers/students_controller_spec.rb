require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe StudentsController, :type => :controller do
  
  describe "POST #create" do
    it "should be able to create a student" do
      email = "test+#{Time.now.to_i.to_s}@test.com"
      post "create", :student => { :name => "Test", :email => email, 
                                  :phone => "12345678", :password => "test" }

      Student.find_by_email(email).should be_present           
    end
  end

  describe "GET #show" do
    it "should be able to retrieve a student" do
      @student = Student.first
      get :show, :id => @student.id
    end
  end

  describe "GET #home" do
    
    it "should be able to retrieve a student" do
      @student = Student.first
      get :home, :id => @student.id
      
    end
  end

end