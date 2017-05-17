require 'rails_helper'

RSpec.describe Project do
  subject { Project.new(params) }

  let(:params) {
    {
      :title => 'Some Big Project'
    }
  }

  describe "validations" do
    it "is valid with valid params" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:title) }

    it { should validate_uniqueness_of(:title) }
  end

  describe "soft delete" do
    it_behaves_like 'a Paranoid model'
  end
end
