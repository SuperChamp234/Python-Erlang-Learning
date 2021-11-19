###### This whole Note is taken from [Functional programming vs. imperative programming (LINQ to XML)](https://docs.microsoft.com/en-us/dotnet/standard/linq/functional-vs-imperative-programming)
tags: #embed

## Functional programming vs. imperative programming

The _functional programming_ paradigm was explicitly created to support a pure functional approach to problem solving. Functional programming is a form of _declarative programming_. In contrast, most mainstream languages, including object-oriented programming (OOP) languages such as C#, Visual Basic, C++, and Java, were designed to primarily support _imperative_ (procedural) programming.

With an imperative approach, a developer writes code that specifies the steps that the computer must take to accomplish the goal. This is sometimes referred to as _algorithmic_ programming. In contrast, a functional approach involves composing the problem as a set of functions to be executed. You define carefully the input to each function, and what each function returns. The following table describes some of the general differences between these two approaches.

| Characteristic            | Imperative Approach                                                  | Functional Approach                                                |
| ------------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------------ |
| Programmer Focus          | How to perform tasks (algorithms) and how to track changes in state. | What information is desired and what transformations are required. |
| State changes             | Important                                                            | Non-Existent                                                       |
| Order of execution        | Important.                                                           | Low importance.                                                    |
| Primary flow control      | Loops, conditionals, and function (method) calls.                    | Function calls, including recursion.                               |
| Primary manipulation unit | Instances of structures or classes.                                  | Functions as first-class objects and data collections.             | 
^859f8o
