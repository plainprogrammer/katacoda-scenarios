# Code Smells

Why do we even need to worry about _refactoring_? If _refactoring_ is about
changing form but not function, how do we decide when to make changes? **Code
Smells** are observations of our code that provide clues as to how and where
change might be desirable. The best way to learn about _code smells_ is to
see some examples.

Let's open our `long_method.rb`{{open}}. And, let's ask some questions
of the code.

* Are we comfortable with how long this method is?
* How many things is this method doing?
* Are all these operations related to each other?
* Is there any behavior that doesn't seem to belong?

In seeking to answer these questions, and others we might want to ask, we can
make some observations about this code. For example; this method is doing three
distinct things as part of calculating the sales tax for a product: determining
exemption, determining tax rate, and calculating amount of applicable tax. In a
more complete system there are likely also some details coming to us from the
two arguments that could be better encapsulated: price information and state of
taxation. Both of those are contextually necessary to make a calculation, but
could they be provided in a more complete argument, such as an Order object?

These quick observations and exploratory thoughts are the heart of what
_refactoring_ is. And these intuitions and the patterns of less optimal code we
can observe are the essence of _code smells_. In this case we can recognize
a surface-level concern that this method is long. We can then follow up that
observation by exploring why and see that it is doing multiple things to get to
its main purpose of calculation. And, in a broader system context we can ask
clarifying questions about the things this method depends on or collaborates
with to expose more opportunities to potentially improve the system beyond this
one method.

In the next section we'll look at on of the most basic _refactoring_ techniques
that will help us improve this method.