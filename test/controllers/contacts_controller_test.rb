require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { bio: @contact.bio, email: @contact.email, first-name: @contact.first-name, last-name: @contact.last-name, phone: @contact.phone, publications: @contact.publications, title: @contact.title, twitter: @contact.twitter, verified: @contact.verified }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { bio: @contact.bio, email: @contact.email, first-name: @contact.first-name, last-name: @contact.last-name, phone: @contact.phone, publications: @contact.publications, title: @contact.title, twitter: @contact.twitter, verified: @contact.verified }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
