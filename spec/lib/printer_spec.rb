require 'rails_helper'
require Rails.root.join('lib', 'printer')

describe Printer do
  let!(:projects) { 2.times.map { Project.create!(title: Faker::Company.catch_phrase) } }

  it 'should return all project as yaml' do
    printed = Printer.call
    expect(printed).to eq(Project.all.map(&:attributes).to_yaml)
  end
end