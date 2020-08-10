# Form & Functionality

Refactoring is all about changing the form, or structure, of our code. When we
change its functionality we are doing something other than _refactoring_. This
is a nuance that can get easily overlooked as many developers use the term
_refactoring_ to mean any substantial change to the code, inclusive of both
form and function.

Let's consider a highly contrived example. We have a collection of tasks that
have due dates. If we had a method called `by_due` to organize those tasks for
us, what should it do? Below are two possibilities:

<pre>
<code class="ruby">
def by_due(tasks)
  result = Hash.new([])

  tasks.each do |task|
    hsh[task.due] << task
  end

  result
end

def by_due(tasks)
  result = []

  result = tasks.sort_by do |task|
    task.due
  end

  result
end
</code>
</pre>

The first case groups our tasks into a Hash by their due date value. The second
sorts our tasks by their due date. Which is correct depends on what we expect
the behavior of the system to be. These methods are not refactorings of each
other because they do two very different things.

So, let's think about how we might actually refactor the second of our `by_due`
methods.

Let's open `example.rb`{{open}} and then copy our code below:

<pre class="file" data-filename="example.rb" data-target="replace">
<code class="ruby">
def by_due(tasks)
  result = []

  result = tasks.sort_by do |task|
    task.due
  end

  result
end
</code>
</pre>

To give ourselves confidence we aren't changing behavior, let's also set up a
simple test case.

Open `example_test.rb`{{open}}, and copy our code below:

<pre class="file" data-filename="example_test.rb" data-target="replace">
<code class="ruby">
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
</code>
</pre>

And, let's run our test to make sure we are starting from a working state.

`ruby example_test.rb`{{execute}}