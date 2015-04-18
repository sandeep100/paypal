require 'test_helper'

class AttorneysControllerTest < ActionController::TestCase
  setup do
    @attorney = attorneys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attorneys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attorney" do
    assert_difference('Attorney.count') do
      post :create, attorney: { about: @attorney.about, address1: @attorney.address1, address2: @attorney.address2, altematives: @attorney.altematives, city: @attorney.city, country: @attorney.country, email: @attorney.email, expert: @attorney.expert, first_name: @attorney.first_name, gender: @attorney.gender, greduate_year: @attorney.greduate_year, jurisdiction: @attorney.jurisdiction, last_name: @attorney.last_name, middle_name: @attorney.middle_name, school_name: @attorney.school_name, support: @attorney.support, zip_code: @attorney.zip_code }
    end

    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should show attorney" do
    get :show, id: @attorney
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attorney
    assert_response :success
  end

  test "should update attorney" do
    patch :update, id: @attorney, attorney: { about: @attorney.about, address1: @attorney.address1, address2: @attorney.address2, altematives: @attorney.altematives, city: @attorney.city, country: @attorney.country, email: @attorney.email, expert: @attorney.expert, first_name: @attorney.first_name, gender: @attorney.gender, greduate_year: @attorney.greduate_year, jurisdiction: @attorney.jurisdiction, last_name: @attorney.last_name, middle_name: @attorney.middle_name, school_name: @attorney.school_name, support: @attorney.support, zip_code: @attorney.zip_code }
    assert_redirected_to attorney_path(assigns(:attorney))
  end

  test "should destroy attorney" do
    assert_difference('Attorney.count', -1) do
      delete :destroy, id: @attorney
    end

    assert_redirected_to attorneys_path
  end
end
