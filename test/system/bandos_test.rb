require "application_system_test_case"

class BandosTest < ApplicationSystemTestCase
  setup do
    @bando = bandos(:one)
  end

  test "visiting the index" do
    visit bandos_url
    assert_selector "h1", text: "Bandos"
  end

  test "creating a Bando" do
    visit bandos_url
    click_on "New Bando"

    fill_in "Description", with: @bando.description
    fill_in "Title", with: @bando.title
    fill_in "User", with: @bando.user_id
    click_on "Create Bando"

    assert_text "Bando was successfully created"
    click_on "Back"
  end

  test "updating a Bando" do
    visit bandos_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bando.description
    fill_in "Title", with: @bando.title
    fill_in "User", with: @bando.user_id
    click_on "Update Bando"

    assert_text "Bando was successfully updated"
    click_on "Back"
  end

  test "destroying a Bando" do
    visit bandos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bando was successfully destroyed"
  end
end
