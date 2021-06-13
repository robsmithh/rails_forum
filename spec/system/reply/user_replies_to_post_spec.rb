require 'rails_helper'


RSpec.describe 'Reply to post' do
  it 'allows user to reply to existing post' do
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

    when_i_enter_a_reply
    and_i_click_create_reply
    then_i_am_taken_to_the_show_post_page
    and_i_can_see_my_reply
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

  def when_i_enter_a_reply
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
end
