require 'rails_helper'

feature 'photos' do
  context 'no photo have been posted' do
    scenario 'should display a prompt to post a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a restaurant'
    end
  end
end
