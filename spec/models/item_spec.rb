require 'rails_helper'

RSpec.describe Item do
  subject { Item.new(params) }

  let(:params) {
    {
      :action => 'Do something',
      :project_id => 123,
    }
  }

  describe "validations" do
    it "is valid with valid params" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:action) }

    it do
      should validate_uniqueness_of(:action).
        scoped_to(:project_id).
        with_message('should be unique within a project')
    end
  end

  describe "soft delete" do
    it_behaves_like 'a Paranoid model'
  end
end
