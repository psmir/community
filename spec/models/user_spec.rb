require 'rails_helper'

describe User do
  let!(:user) { create :user }

  it { expect(user).to be_persisted }
end
