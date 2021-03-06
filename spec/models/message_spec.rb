require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:message) { FactoryGirl.create :message }

  describe "validations" do
    it "requires a valid email address" do
      message.email = ""
      message.save
      expect(message.errors).to(have_key(:email))
    end

    it "requires a description presence" do
      message = FactoryGirl.build :invalid_no_message
      message.save
      expect(message.errors).to(have_key(:content))
    end

    it "requires a description to be longer than 50 characters" do
      message = FactoryGirl.build :invalid_short_message
      message.save
      expect(message.errors).to(have_key(:content))
    end
  end

end
