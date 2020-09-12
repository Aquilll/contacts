
# articles_controller_test.rb
class ContactsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_equal 'index', @controller.action_name
    assert_response :success
  end

  test 'should get root' do
    get '/'
    assert_response :success
  end

  test 'should create feedback' do
    post contacts_url, params: { first_name: 'yolo',
                                 last_name: 'xoxo',
                                 email: 'asdad@da.com',
                                 phone: 12_343_434_234,
                                 message: 'hello apple' }

    assert_redirected_to 'http://www.example.com/en/contacts'
  end
end
