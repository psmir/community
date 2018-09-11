require 'rails_helper'

describe 'Sign In', js: true do
  let!(:user) { create :user }

  before do
    visit '/'
    click_link 'Sign In'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'Sign In'
  end

  it { expect(page).to have_link "Logout #{user.email}" }
end
