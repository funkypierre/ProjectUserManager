require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'before save' do
    before(:each) do
      @user = create(:user)
    end

    it 'cannot have an empty name' do
      project = Project.create(user: @user)
      expect(project).to_not be_valid
    end

    it 'cannot have no user attached' do
      project = Project.create(name: "audit")
      expect(project).to_not be_valid
    end
  end
end
