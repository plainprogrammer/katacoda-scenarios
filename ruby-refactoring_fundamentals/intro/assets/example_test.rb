require "minitest/autorun"
require "date"
require_relative "./example"

class TestExample < MiniTest::Unit::TestCase
  Task = Struct.new(:name, :due)

  def setup
    @first_task_due = Task.new("Get eggs", Date.new(2020, 12, 15))
    @second_task_due = Task.new("Get milk", Date.new(2021, 1, 1))
    @tasks = [@second_task_due, @first_task_due]
  end

  def test_that_by_due_orders_correctly
    assert_equal [@first_task_due, @second_task_due], by_due(@tasks)
  end
end
