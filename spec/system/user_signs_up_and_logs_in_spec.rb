require 'rails_helper'

RSpec.describe "Sign up and log in", :type => :system do
  it 'allows a user to sign up, log in and log out' do
    when_i_arrive_on_the_homepage
    and_i_click_sign_up_link
    then_i_am_taken_to_the_registration_page

    when_i_enter_invalid_details
    and_i_click_the_sign_up_button
    then_i_am_told_i_have_entered_invalid_details

    when_i_enter_valid_details
    and_i_click_the_sign_up_button
    then_i_am_taken_to_the_homepage
    and_i_am_told_i_signed_up_successfully

    when_i_click_sign_out_link
    then_i_am_taken_to_the_homepage
    and_i_am_told_i_signed_out_successfully
  end

    def when_i_arrive_on_the_homepage
      visit '/'
    end

    def and_i_click_sign_up_link
      click_link 'Sign up'
    end

    def then_i_am_taken_to_the_registration_page
      expect(page).to have_current_path(new_user_registration_path)
    end

    def when_i_enter_invalid_details
      fill_in 'email', with: 'testuser1@example'
      fill_in 'username', with: 'testuser1'
      fill_in 'first_name', with: 'test'
      fill_in 'last_name', with: 'user1'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'
    end

    def and_i_click_the_sign_up_button
      click_button 'Sign up'
    end

    def then_i_am_told_i_have_entered_invalid_details
      expect(page).to have_text('Email is invalid')
    end

    def when_i_enter_valid_details
      fill_in 'email', with: 'testuser1@example.com'
      fill_in 'username', with: 'testuser1'
      fill_in 'first_name', with: 'test'
      fill_in 'last_name', with: 'user1'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'
    end

    def then_i_am_taken_to_the_homepage
      expect(page).to have_current_path(root_path)
    end

    def and_i_am_told_i_signed_up_successfully
      expect(page).to have_text('Signed up successfully')
    end

    def when_i_click_sign_out_link
      click_link 'Sign out'
    end

    def and_i_am_told_i_signed_out_successfully
      expect(page).to have_text('Signed out successfully')
    end

end
