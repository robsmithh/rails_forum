require 'rails_helper'

RSpec.describe "User eidts and deletes post", :type => :system do
  it 'allows a user to edit and delete a post' do
    when_i_arrive_on_the_homepage
    create_user_and_log_in
    create_post

    when_i_click_on_my_posts
    then_i_am_taken_to_my_posts_page
    and_i_can_see_the_post_just_created

    when_i_select_the_post_i_just_created
    then_i_am_taken_to_the_show_post_page

    when_i_click_edit_post
    then_i_am_taken_to_the_edit_post_page

    when_i_enter_valid_details
    and_click_update_post
    then_i_am_taken_to_the_show_post_page
    and_i_am_told_the_post_has_been_updated
    and_i_can_see_the_changes_i_have_made

    when_i_click_delete_post
    and_i_confirm_the_action
    then_i_am_taken_to_my_posts_page
    and_i_am_told_the_post_was_deleted
    and_i_can_no_longer_see_my_post
  end

  def when_i_arrive_on_the_homepage
    visit '/'
  end

  def when_i_click_on_my_posts
    click_link 'My posts'
  end

  def then_i_am_taken_to_my_posts_page
    expect(page).to have_current_path(posts_path)
  end

  
end
