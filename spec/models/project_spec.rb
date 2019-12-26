require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'before save' do
    before(:each) do
      @user = create(:user)
    end

    it 'cannot have an empty mail' do
      contact = Contact.create(user: @user)
      expect(contact).to_not be_valid
    end

    it 'cannot have no user attached' do
      contact = Contact.create(email: "thierry@gmail.com")
      expect(contact).to_not be_valid
    end
  end
end
