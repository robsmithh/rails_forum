require 'rails_helper'

RSpec.describe 'create, edit and destroy reply' do
  it 'allows the user to create, edit and destroy a reply' do
    when_i_arrive_on_the_homepage
    create_user_and_log_in(false, "test_user1@example.com", 'testuser1')
    create_post
    sign_out_current_user
    create_user_and_log_in

    when_i_click_recent_posts
    then_i_am_taken_to_recent_posts_page
    and_i_can_see_the_most_recent_post

    when_i_select_the_most_recent_post
    then_i_am_taken_to_the_post_show_page

    when_i_click_on_reply
    then_i_am_taken_to_new_reply_page

    when_i_enter_a_valid_reply
    and_i_click_create_reply
    then_i_am_taken_to_the_show_post_page
    and_i_can_see_my_reply

    when_i_select_edit_on_my_reply
    then_i_am_taken_to_the_reply_edit_page

    when_i_enter_valid_details
    and_i_click_amend_reply
    then_i_am_taken_to_the_show_post_page
    and_i_can_see_my_updated_reply

    when_i_select_delete_on_my_reply
    and_confirm_my_selection
    then_i_am_taken_to_the_show_post_page
    and_i_can_no_longer_see_my_reply
  end

  def when_i_click_recent_posts
    click_link 'Recent posts'
  end

  def then_i_am_taken_to_recent_posts_page
    expect(page).to have_current_path(recent_posts_path)
  end

  def and_i_can_see_the_most_recent_post
    expect(page).to have_text('Post title')
    expect(page).to have_text('This is the post')
  end

  def when_i_select_the_most_recent_post
    click_link 'Post title'
  end

  def then_i_am_taken_to_the_post_show_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def when_i_click_on_reply
    click_link 'Reply'
  end

  def then_i_am_taken_to_new_reply_page
    expect(page).to have_current_path('/replies/new?post_id=1')
  end

  def when_i_enter_a_valid_reply
    fill_in :comment, with: 'This is the reply'
  end

  def and_i_click_create_reply
    click_button 'Create reply'
  end

  def then_i_am_taken_to_the_show_post_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def and_i_can_see_my_reply
    expect(page).to have_text('This is the reply')
  end

  def when_i_select_edit_on_my_reply
    click_link 'Edit'
  end

  def then_i_am_taken_to_the_reply_edit_page
    expect(page).to have_current_path('/replies/1/edit?post_id=1')
  end

  def when_i_enter_valid_details
    fill_in :comment, with: 'This is the amended reply'
  end

  def and_i_click_amend_reply
    click_button 'Amend reply'
  end

  def then_i_am_taken_to_the_show_post_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def and_i_can_see_my_updated_reply
    expect(page).to have_text('This is the amended reply')
  end

  def when_i_select_delete_on_my_reply
    click_link 'Delete'
  end

  def and_confirm_my_selection
    page.driver.browser.switch_to.alert.accept
  end

  def and_i_can_no_longer_see_my_reply
    expect(page).to_not have_text('This is the amended reply')
  end
end
