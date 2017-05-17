require 'rails_helper'

RSpec.describe 'user creates project with item' do
  it "creates project with item" do
    visit '/'
    click_on 'New Project'
    fill_in 'Title', with: 'test project'
    click_on 'Create Project'
    expect(page).to have_content 'Project was successfully created.'
    click_on 'New Item'
    fill_in 'Action', with: 'test action'
    click_on 'Create Item'
    expect(page).to have_content 'Item was successfully created.'
  end
end