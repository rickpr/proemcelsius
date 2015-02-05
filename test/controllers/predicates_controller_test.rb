require 'test_helper'

class PredicatesControllerTest < ActionController::TestCase
  setup do
    @predicate = predicates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:predicates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create predicate" do
    assert_difference('Predicate.count') do
      post :create, predicate: { name: @predicate.name, prolog: @predicate.prolog }
    end

    assert_redirected_to predicate_path(assigns(:predicate))
  end

  test "should show predicate" do
    get :show, id: @predicate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @predicate
    assert_response :success
  end

  test "should update predicate" do
    patch :update, id: @predicate, predicate: { name: @predicate.name, prolog: @predicate.prolog }
    assert_redirected_to predicate_path(assigns(:predicate))
  end

  test "should destroy predicate" do
    assert_difference('Predicate.count', -1) do
      delete :destroy, id: @predicate
    end

    assert_redirected_to predicates_path
  end
end
