# Code Smells

Why do we even need to worry about _refactoring_? If _refactoring_ is about
changing form but not function, how do we decide when to make changes? **Code
Smells** are observations of our code that provide clues as to how and where
change might be desirable. _Code Smells_ are signals that the code is not as
clear or concise as it could be.
 
Let's look at a really basic example in `long_method.rb`{{open}}. We can start
by asking some questions of the code.

* Are we comfortable with how long this method is?
* How many things is this method doing?
* Are all these operations related to each other?
* Is there any behavior that doesn't seem to belong?

In answering these questions, and others we might ask, we can make some
observations about this code: 

* This method calculates the sales tax for a specific product and destination.
* This method is doing three distinct things to achieve its end:
  * Determining sales tax exemption.
  * Identifying sales tax rate.
  * Calculating applicable amount of sales tax.

In a more complete system there are likely also some details coming to us from
the two arguments that could be better encapsulated, such as price information
and state of taxation. Both of those are contextually necessary to make a
calculation, but could they be provided in a more complete argument, such as an
Order object?

These quick observations and exploratory thoughts are the heart of what
_refactoring_ builds upon. These intuitions and the patterns of less optimal
code we can observe are the essence of _code smells_. In this case we can
recognize a surface-level concern that this method is long for what it's main 
concern is: calculating applicable sales tax. We can follow up that observation
by exploring why and see that it is doing multiple things to get to its main
purpose. In a broader system context we can ask clarifying questions about the
things this method depends on or collaborates with to expose more opportunities
to improve the system beyond this one method.

In the next section we'll look at one of the most basic _refactoring_ techniques
that will help us improve this method.

Before we get to that, let's run our tests to confirm everything is starting in
a working state: `ruby long_method_test.rb`{{execute}}