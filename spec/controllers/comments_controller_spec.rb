require 'rails_helper'
require 'helpers/controller_helper'

RSpec.describe CommentsController, :type => :controller do
  
  describe "POST #create" do
    it "should be able to create a comment" do
      content = Time.now.to_i.to_s
      post "create", :comment => { :content => content, :commentor => 1, post_id => 1 }

      Comment.find_by_content(content).should be_present           
    end
  end

end