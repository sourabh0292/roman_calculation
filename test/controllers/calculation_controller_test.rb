require 'test_helper'

class CalculationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get to calculation page" do
  	post calculation_path, params: {calculation: {calculation: "X", calculation1: "V", operator: "+"}}
	assert_response :success
	assert_select "span", text: "XV"
  end
end
