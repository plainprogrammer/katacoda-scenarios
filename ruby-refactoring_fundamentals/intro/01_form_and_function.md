# Form & Functionality

Refactoring is all about changing the form, or structure, of our code. When we
change its functionality we are doing something other than _refactoring_. This
is a nuance that can get easily overlooked as many developers use the term
_refactoring_ to mean any substantial change to the code, inclusive of both
form and function.

Let's consider a highly contrived example. We have a collection of tasks that
have due dates. If we had a method called `by_due` to organize those tasks for
us, what should it do? Below is one of the possibilities:

<pre class="ruby">
def by_due(tasks)
  result = []

  result = tasks.sort_by do |task|
    task.due
  end

  result
end
</pre>

In a different context this method might return a hash keyed to the various due
dates of the tasks provided. In this case we are doing a basic sort on the due
date and return an array. If we wanted to change the results of this to a hash,
that's not a _refactoring_ it's a rewriting and re-definition of the method and
its behavior.

So, let's think about how we might actually _refactor_ the example we have. We
want to change the structure to be more clear without impacting behavior.

Let's open `by_due.rb`{{open}} and look at the code. To give ourselves
confidence we aren't changing behavior, let's also consider a simple test case.
So, let's also open `by_due_test.rb`{{open}}, and examine test code we might
have for a method like this.

Let's run our test to make sure we are starting from a working state.

`ruby by_due_test.rb`{{execute}}

Our test should pass and let us know that we are in a good place to change this
code. So, let's make a simple change to avoid reassigning `result`. We will
simply delete the first line of the method that has `result = []`.

<pre class="file ruby" data-filename="by_due.rb" data-target="replace">
def by_due(tasks)
  result = tasks.sort_by do |task|
    task.due
  end

  result
end
</pre>

We can re-run our tests after making the change to make sure everything still
works: `ruby by_due_test.rb`{{execute}}

Next, we can take advantage of Ruby's implicit return values to eliminate our
need for assignment of any variables at all.

<pre class="file ruby" data-filename="by_due.rb" data-target="replace">
def by_due(tasks)
  tasks.sort_by do |task|
    task.due
  end
end
</pre>

And, we can run our tests again to verify we have not changed behavior:
`ruby by_due_test.rb`{{execute}}

We have now successfully _refactored_ this method. We have made it more
concise; and, in that process more clear what is the main concern of this
method: sorting. We maintained the functional qualities while only changing the
structure of the method. This is the kind of change we want when we approach
_refactoring_.

In our next section we will explore the kinds of things we can observe in our
code that let us know where _refactoring_ may be helpful.