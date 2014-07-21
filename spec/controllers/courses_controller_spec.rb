require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe CoursesController, :type => :controller do
  
  describe "GET #index" do
    it "should list courses" do
      get :index
    end
  end

end