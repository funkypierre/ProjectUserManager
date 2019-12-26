require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  context 'when user is an admin' do
    before(:each) do
      admin = create(:user)
      admin.add_role :admin
      @ability = Ability.new(admin)
    end

    it 'can destroy a project from another user' do
      user = create(:user)
      project = create(:project, user: user)
      expect(@ability.can?(:destroy, project)).to be true
    end
    it 'can update a contact from another user' do
      user = create(:user)
      project = create(:project, user: user)
      contact = create(:contact, user: user, project: project)
      expect(@ability.can?(:update, contact)).to be true
    end
  end

  context 'when user is an employee' do
    before(:each) do
      user = create(:user)
      user.add_role :employee
      @ability = Ability.new(user)
    end

    it 'can create a project' do
      expect(@ability.can?(:create, Project)).to be true
    end
    it 'cannot update a project from another user' do
      other_user = create(:user)
      other_project = create(:project, user: other_user)

      expect(@ability.can?(:update, other_project)).to be false
    end
  end

  context 'when user is a visitor' do
    before(:each) do
      user = create(:user)
      user.add_role :visitor
      @ability = Ability.new(user)
    end

    it 'cannot create a project' do
      expect(@ability.can?(:create, Project)).to be false
    end

    it 'cannot read a contact' do
      expect(@ability.can?(:read, Contact)).to be false
    end
  end
end
