require 'rails_helper'

RSpec.describe "User creates post", :type => :system do
  it 'allows a user to create a post' do
    when_i_arrive_on_the_homepage
    create_user_and_log_in

    when_i_click_create_post
    then_i_am_taken_to_the_create_post_page

    when_i_enter_valid_details
    and_i_click_create_post
    then_i_am_taken_to_my_posts_page
    and_i_am_told_my_post_was_added_successfully
    and_i_can_see_the_post_i_just_created

  end

  def when_i_arrive_on_the_homepage
    visit '/'
  end

  def when_i_click_create_post
    click_link 'Create post'
  end

  def then_i_am_taken_to_the_create_post_page
    expect(page).to have_current_path(new_post_path)
  end

  def when_i_enter_valid_details
    fill_in :title, with: "Post Title"
    fill_in :post, with: "This is the post"
  end

  def and_i_click_create_post
    click_button 'Create post'
  end

  def then_i_am_taken_to_my_posts_page
    expect(page).to have_current_path(post_path(Post.last))
  end

  def and_i_am_told_my_post_was_added_successfully
    expect(page).to have_text('Post successfully created')
  end

  def and_i_can_see_the_post_i_just_created
    expect(page).to have_text('Post Title')
    expect(page).to have_text('This is the post')
  end
end
