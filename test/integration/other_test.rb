require 'test_helper'

class OtherTest < ActionDispatch::IntegrationTest
  # Capybara / PhantomJS freezes if we don't allow it time to complete
  # some actions.  0.05 works for me.  YMMV.
  SLEEP_TIME = 0.05

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  TODO_ITEM_ONE = 'buy some cheese ' + rand(100).to_s + ' times'
  TODO_ITEM_TWO = 'feed the cat ' + rand(100).to_s + ' times'
  TODO_ITEM_THREE = 'book a doctors appointment'

  test "other allow me to add todo items" do
    visit "/"

    Percy::Capybara.snapshot(page, name: 'Empty todo list')

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]
    enter_item(TODO_ITEM_TWO)
    assert_items [TODO_ITEM_ONE, TODO_ITEM_TWO]

    Percy::Capybara.snapshot(page, name: 'Todo list with 2 todos')
  end

  test "other allow me to add one todo item" do
    visit "/"

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]

    Percy::Capybara.snapshot(page, name: 'Todo list with 1 todo')
  end

  test "other allow me to add todo items1" do
    visit "/"

    Percy::Capybara.snapshot(page, name: 'Empty todo list')

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]
    enter_item(TODO_ITEM_TWO)
    assert_items [TODO_ITEM_ONE, TODO_ITEM_TWO]

    Percy::Capybara.snapshot(page, name: 'Todo list with 2 todos')
  end

  test "other allow me to add one todo item1" do
    visit "/"

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]

    Percy::Capybara.snapshot(page, name: 'Todo list with 1 todo')
  end

  test "other allow me to add todo items2" do
    visit "/"

    Percy::Capybara.snapshot(page, name: 'Empty todo list')

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]
    enter_item(TODO_ITEM_TWO)
    assert_items [TODO_ITEM_ONE, TODO_ITEM_TWO]

    Percy::Capybara.snapshot(page, name: 'Todo list with 2 todos')
  end

  test "other allow me to add one todo item2" do
    visit "/"

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]

    Percy::Capybara.snapshot(page, name: 'Todo list with 1 todo')
  end

  test "other allow me to add todo items3" do
    visit "/"

    Percy::Capybara.snapshot(page, name: 'Empty todo list')

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]
    enter_item(TODO_ITEM_TWO)
    assert_items [TODO_ITEM_ONE, TODO_ITEM_TWO]

    Percy::Capybara.snapshot(page, name: 'Todo list with 2 todos')
  end

  test "other allow me to add one todo item3" do
    visit "/"

    enter_item(TODO_ITEM_ONE)
    assert_items [TODO_ITEM_ONE]

    Percy::Capybara.snapshot(page, name: 'Todo list with 1 todo')
  end

  private

  def assert_items(ary)
    assert_equal ary, todo_items.map { |el| el.find(".view label").text }
  end

  def todo_items
    sleep(SLEEP_TIME)
    page.all("#todos li")
  end

  def filters
    sleep(SLEEP_TIME)
    page.all("#filters li a")
  end

  def create_standard_items
    enter_item(TODO_ITEM_ONE)
    enter_item(TODO_ITEM_TWO)
    enter_item(TODO_ITEM_THREE)
  end

  def enter_item(text)
    fill_in 'new-todo', with: text
    find('#new-todo').native.send_key(:enter)
    sleep(SLEEP_TIME)
  end
end
