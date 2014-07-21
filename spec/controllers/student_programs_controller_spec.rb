require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe StudentProgramsController, :type => :controller do

  describe "POST #create" do
    it "should be able to register for a course" do
      post "create", :student_program => { :program_id => 1, :student_id => 1 }

      StudentProgram.find_by_program_id(1).should be_present           
    end
  end

  describe "GET #index" do
    it "should list StudentPrograms" do
      get :index
    end
  end

end