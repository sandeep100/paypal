require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { about: @company.about, address1: @company.address1, address2: @company.address2, business_area: @company.business_area, city: @company.city, company_name: @company.company_name, country: @company.country, dept_size: @company.dept_size, first_name: @company.first_name, industry_type: @company.industry_type, last_name: @company.last_name, person_title: @company.person_title, school_name: @company.school_name, zip_code: @company.zip_code }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { about: @company.about, address1: @company.address1, address2: @company.address2, business_area: @company.business_area, city: @company.city, company_name: @company.company_name, country: @company.country, dept_size: @company.dept_size, first_name: @company.first_name, industry_type: @company.industry_type, last_name: @company.last_name, person_title: @company.person_title, school_name: @company.school_name, zip_code: @company.zip_code }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
