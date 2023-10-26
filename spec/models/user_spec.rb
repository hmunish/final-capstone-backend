require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(username: 'John')
    expect(user).to be_valid
  end
  it 'is not valid with empty string' do
    user = User.new(username: '')
    expect(user).not_to be_valid
  end
  it 'is not valid with a nil name' do
    user = User.new(username: nil)
    expect(user).not_to be_valid
  end
end
