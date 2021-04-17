require "test_helper"

class BandosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bando = bandos(:one)
  end

  test "should get index" do
    get bandos_url
    assert_response :success
  end

  test "should get new" do
    get new_bando_url
    assert_response :success
  end

  test "should create bando" do
    assert_difference('Bando.count') do
      post bandos_url, params: { bando: { description: @bando.description, title: @bando.title, user_id: @bando.user_id } }
    end

    assert_redirected_to bando_url(Bando.last)
  end

  test "should show bando" do
    get bando_url(@bando)
    assert_response :success
  end

  test "should get edit" do
    get edit_bando_url(@bando)
    assert_response :success
  end

  test "should update bando" do
    patch bando_url(@bando), params: { bando: { description: @bando.description, title: @bando.title, user_id: @bando.user_id } }
    assert_redirected_to bando_url(@bando)
  end

  test "should destroy bando" do
    assert_difference('Bando.count', -1) do
      delete bando_url(@bando)
    end

    assert_redirected_to bandos_url
  end
end
