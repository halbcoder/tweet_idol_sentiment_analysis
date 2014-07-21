require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe StudentCoursesController, :type => :controller do

  describe "POST #create" do
    it "should be able to register for a course" do
      post "create", :student_course => { :course_id => 1, :student_id => 1 }

      StudentCourse.find_by_course_id(1).should be_present           
    end
  end

  describe "GET #index" do
    it "should list StudentCourses" do
      get :index
    end
  end

end