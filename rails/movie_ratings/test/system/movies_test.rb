require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit movies_url
  #
  #   assert_selector "h1", text: "Movie"
  # end
  #
  #
  setup do 
    @user = users(:one)
  end

   test "insert a new movie" do
    # login_as users(:one)
    login_as @user
    visit movies_url
    #assert_incurrence "Movies", page.body
    #puts page.body
    assert_selector 'a', text: 'New movie', visible: true
    click_on "New movie"

    assert_current_path new_movie_path
    #save_and_open_page

    fill_in label:, with: "Inception"
    fill_in "Director", with: "Christopher Nolan"
    fill_in "Location", with: "Los Angeles"
    fill_in "Plot", with: "A thief who steals corporate secrets through the use of dream-sharing technology."
    #upload_file "movie_poster", Rails.root.join("test/fixtures/files/inception.jpg")
    click_on "Create Movie"
    assert_current_path movie_path(Movie.last)
    assert_text "Movie was successfully created"
  end
   
  private

  def login_as(user)
    visit new_session_path
    fill_in placeholder: "Enter your email address", with: user.email_address
    fill_in placeholder: "Enter your password", with: "password"
    click_on "Sign in" 
    assert_current_path root_path
  end
end
