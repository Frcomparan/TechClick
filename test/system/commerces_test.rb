require "application_system_test_case"

class CommercesTest < ApplicationSystemTestCase
  setup do
    @commerce = commerces(:one)
  end

  test "visiting the index" do
    visit commerces_url
    assert_selector "h1", text: "Commerces"
  end

  test "should create commerce" do
    visit commerces_url
    click_on "New commerce"

    fill_in "Address", with: @commerce.address
    fill_in "City", with: @commerce.city
    fill_in "Name", with: @commerce.name
    fill_in "Postal code", with: @commerce.postal_code
    fill_in "State", with: @commerce.state
    fill_in "User", with: @commerce.user_id
    click_on "Create Commerce"

    assert_text "Commerce was successfully created"
    click_on "Back"
  end

  test "should update Commerce" do
    visit commerce_url(@commerce)
    click_on "Edit this commerce", match: :first

    fill_in "Address", with: @commerce.address
    fill_in "City", with: @commerce.city
    fill_in "Name", with: @commerce.name
    fill_in "Postal code", with: @commerce.postal_code
    fill_in "State", with: @commerce.state
    fill_in "User", with: @commerce.user_id
    click_on "Update Commerce"

    assert_text "Commerce was successfully updated"
    click_on "Back"
  end

  test "should destroy Commerce" do
    visit commerce_url(@commerce)
    click_on "Destroy this commerce", match: :first

    assert_text "Commerce was successfully destroyed"
  end
end
