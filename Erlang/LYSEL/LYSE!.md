tags: #erlang #main #LYSE
## Learn you some Erlang!
Erlang is a *functional* programming language, which is quite different from normal imperative languages. What are the differences?

![[Microsoft .NET docs - Functional VS Procedural#^859f8o]]
That's a lot of differences, most of them I don't understand.... let's just go according to the book.
```
y = 6
x = 2 + y
∴ x = 8

x = x + 2
x = 8 + 2
x = 10 //but x was equal to 8 and can't be equal to 10!
```
So, in functional programming languages you cannot change values of variables assigned previously, kind of like variables in mathematics.

Even functions should return the same result for a set argument. Such behavior is called **referential transparency**. But what if a function, suppose `dateToday()` breaks the transparency? Well then it's okay! Some times it can be broken in order to solve real-world problems.

###### How does erlang display concurrency and high reliability?
Erlang follows what's called an **actor model**, in which an actor is described as a lonely person sitting in a room by a mailbox which is their only stimuli. The person responds to the mails in a specific way. Thus, there are thousands of such actors responding to such "mails" and one's actions or mistakes are not interfering with the other's work.

Thus, it can be said that
> Erlang forces you to write actors (processes) that will share **no information** with other bits of code *unless they pass messages* to each other. Every communication is **explicit**, **traceable** and **safe**.

Erlang's code is compiled to bytecode and run in a VM, just like Java and some other stuff. Thus it can run anywhere. The standard package includes the development tools, the Open Telecom Platform(OTP) Framework, a web server, a parse generator, and the [mnesia database](https://en.wikipedia.org/wiki/Mnesia), a key-value storage system able to replicate itself on many servers, supporting nested transactions and letting you store any kind of Erlang data.

![[Where to get help#Where to get help]]

## Pages
[[Shell|Erlang Shell]]
[[Basic Syntax|Basics of Erlang]]
