require 'rails_helper'

RSpec.describe "Sign up and log in", :type => :system do
  it 'allows a user to sign up, edit their account, then delete their account' do
    when_i_arrive_on_the_homepage
    and_i_click_sign_up_link
    then_i_am_taken_to_the_registration_page

    when_i_enter_valid_details
    and_i_click_the_sign_up_button
    then_i_am_taken_to_the_homepage
    and_i_am_told_i_signed_up_successfully

    when_i_click_my_profile
    then_i_am_taken_to_the_show_user_page

    when_i_click_edit_profile
    then_i_am_able_to_update_the_profile

    when_i_enter_valid_amended_details
    and_i_click_update
    then_i_am_taken_to_the_show_user_page
    and_told_my_account_was_updated

    when_i_click_edit_profile
    and_i_click_cancel_my_account
    then_i_am_taken_to_the_homepage
    and_i_am_told_my_account_was_deleted
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

  def when_i_enter_valid_details
    fill_in 'email', with: 'testuser1@example.com'
    fill_in 'username', with: 'testuser1'
    fill_in 'first_name', with: 'test'
    fill_in 'last_name', with: 'user1'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
  end

  def and_i_click_the_sign_up_button
    click_button 'Sign up'
  end

  def then_i_am_taken_to_the_homepage
    expect(page).to have_current_path(root_path)
  end

  def and_i_am_told_i_signed_up_successfully
    expect(page).to have_text('Signed up successfully')
  end

  def when_i_click_my_profile
    click_link 'My Profile'
  end

  def then_i_am_taken_to_the_show_user_page
    expect(page).to have_current_path(user_path(User.last.id))
  end

  def when_i_click_edit_profile
    click_link 'Edit profile'
  end

  def then_i_am_able_to_update_the_profile
    expect(page).to have_current_path(edit_user_registration_path)
  end

  def when_i_enter_valid_amended_details
    fill_in 'email', with: 'testuser2@example.com'
    fill_in 'username', with: 'testuser2'
    fill_in 'first_name', with: 'tests'
    fill_in 'last_name', with: 'user2'
    fill_in 'current_password', with: 'password'
  end

  def and_i_click_update
    click_button 'Update'
  end

  def then_i_am_taken_to_the_show_user_page
    expect(page).to have_current_path(user_path(User.last.id))
  end

  def and_told_my_account_was_updated
    expect(page).to have_text('Account succesfully updated')
  end

  def and_i_click_cancel_my_account
    click_button "Cancel my account"
    page.driver.browser.switch_to.alert.accept
  end

  def then_i_am_taken_to_the_homepage
    expect(page).to have_current_path(root_path)
  end

  def and_i_am_told_my_account_was_deleted
    expect(page).to have_text('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end
end
