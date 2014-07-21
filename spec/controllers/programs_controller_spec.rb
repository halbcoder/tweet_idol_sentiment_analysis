require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe ProgramsController, :type => :controller do
  
  describe "GET #index" do
    it "should list programs" do
      get :index
    end
  end

end