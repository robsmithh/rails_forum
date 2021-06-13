require 'rails_helper'

RSpec.describe "User edits and deletes post", :type => :system do
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

  def and_i_can_see_the_post_just_created
    expect(page).to have_text('Post title')
    expect(page).to have_text('This is the post')
  end

  def when_i_select_the_post_i_just_created
    click_link 'Post title'
  end

  def then_i_am_taken_to_the_show_post_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def when_i_click_edit_post
    click_link 'Edit'
  end

  def then_i_am_taken_to_the_edit_post_page
    expect(page).to have_current_path(edit_post_path(Post.last))
  end

  def when_i_enter_valid_details
    fill_in :title, with: "Post Title 2"
    fill_in :post, with: "This is the post 2"
  end

  def and_click_update_post
    click_button 'Amend post'
  end

  def then_i_am_taken_to_the_show_post_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def and_i_am_told_the_post_has_been_updated
    expect(page).to have_text('Post successfully updated')
  end

  def and_i_can_see_the_changes_i_have_made
    expect(page).to have_text('Post Title 2')
    expect(page).to have_text('This is the post 2')
  end

  def when_i_click_delete_post
    click_link 'Delete post'
  end

  def and_i_confirm_the_action
    page.driver.browser.switch_to.alert.accept
  end

  def and_i_am_told_the_post_was_deleted
    expect(page).to have_text('Post successfully deleted')
  end

  def and_i_can_no_longer_see_my_post
    expect(page).to_not have_text('Post Title 2')
    expect(page).to_not have_text('This is the post 2')
  end
end
