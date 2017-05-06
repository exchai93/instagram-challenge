require 'rails_helper'

feature 'Photos' do
  context 'no photos have been posted' do
    scenario 'should display a prompt to post a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a restaurant'
    end
  end

  context 'photos have been posted' do
    before do
      Photo.create(caption: 'My first photo')
    end
    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('My first photo')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'posting photos' do
    scenario 'prompts user to choose a photo from their library, then displays the new photo' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in 'Caption', with: 'My first photo'
      click_button 'Post'
      expect(page).to have_content 'My first photo'
      expect(current_path).to eq '/photos'

    end
  end


end
