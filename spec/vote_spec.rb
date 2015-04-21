require 'rails_helper'
  describe Vote do 
    describe "validations" do 
      before do
       post = Post.new
       @invalid_vote = post.votes.build(value: 21) 
      end
 
 
      describe "value validation" do
        it "only allows -1 or 1 as values" do
          expect(@invalid_vote.valid?).to eq(false)
        end
      end 
    end
  end
