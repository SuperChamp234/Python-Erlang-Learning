Let's get started with the basic syntax for Erlang

#### Arithmetic Operation
Obviously, Erlang supports basic arithmetic operations. We can use several operators for single expressions, and the operators follow normal precedence rules. Both integer and floating point values are handled by each mathematical operator, with a few exceptions like `div` and `rem` which only work for integer-integer operations.

The `div` and `rem` operators are a bit special, they perform division and modulo operations respectively and only work on integers and return an integral output. The `%` seems to do nothing and I think there might be a different purpose for it going forward.

```
1: 7 / 4
-> 1.75
2: 7 div 4
-> 1
3: 7 rem 4
-> 3
4: 7 //these were 7%4. I am not lying lol.
-> 7
5: 7
-> 7
```

We can even use different base numbers like hexadecimal and binary. We must use the syntax `<base>#<value>`
```
12> 2#1010.
10
13> 4#3132.
222
14> 10#49.
49
```

---
#### Variables

As said before, in functional programming variables can't change their values. A variable  **must** start with a capital letter or a `_` (not really used much).

```
17> One.
* 1:1: variable 'One' is unbound
18> One = 1.
1
19> One.
1
20> Two = One + One.
2
21> Two = Two + 1.
** exception error: no match of right hand side value 3
```

###### Role of the `=` operator:
If noticed closely, the role of the `=` operator is to compare the values of the right hand side to the left hand side and well complain ahaha. If the value equals, then it simply return the total value of either side. If an unbound variable is compared, the operator will automatically bind the right hand side value to the variable in the left hand side.

```
22> 3 = Three.
* 1:5: variable 'Three' is unbound //yea we can't do the reverse.
23> Three = 3.
3
```

> This behavior of the `=` operator is the basis of something called 'Pattern matching', which many functional programming languages have, although Erlang's way of doing things is usually regarded as more flexible and complete than alternatives.

If we want to unbound a variable on the shell, we can simply use `f(var)` to unbound it. Mind you this can only be done on the shell, real programs do something else I'm not really sure about.

---
#### Atoms
Atoms are kind of literals in Erlang, with their name for their value.
>  The atom cat means "cat" and that's it. You can't play with it, you can't change it, you can't smash it to pieces; it's cat. Deal with it.
> **Don't drink too much Kool-Aid:**  
Atoms are really nice and a great way to send messages or represent constants. However there are pitfalls to using atoms for too many things: an atom is referred to in an "atom table" which consumes memory (4 bytes/atom in a 32-bit system, 8 bytes/atom in a 64-bit system). The atom table is not garbage collected, and so atoms will accumulate until the system tips over, either from memory usage or because 1048577 atoms were declared.
This means atoms should not be generated dynamically for whatever reason; if your system has to be reliable and user input lets someone crash it at will by telling it to create atoms, you're in serious trouble. Atoms should be seen as tools for the developer because honestly, it's what they are.

---
#### Logical Operators

Pretty normal, although the author warns us about using `=<`. Just don't use it and you'll be fine I guess.

```
1> true and false.
false
2> false or true.
true
3> true xor false.
true
4> not false.
true
5> not (true and true).
false
```
###### `andalso` and `orelse`
These two operators operate on the left hand side first and on the right hand side if only they need to. Also called "short-circuit" operators.

For equality and inequality, slightly different operators are used. `=:=` for equality and `=/=` (inequality lolol) for inequality. Inequality is like "equalto - slash - equalto" not the literal inequality symbol.
```
6> 5 =:= 5.
true
7> 1 =:= 0.
false
8> 1 =/= 0.
true
9> 5 =:= 5.0.
false
10> 5 == 5.0.
true
11> 5 /= 5.0.
false
```
If we notice carefully, then we can see that the different operators *do not differentiate between integers and floating point*. In such places we can use `==` and `/=` operators.

And then there are our basic relational operators.

```
12> 1 < 2.
true
13> 1 < 1.
false
14> 1 >= 1.
true
15> 1 =< 1. //idk but asked to avoid, or keep an eye on I guess
true
```

> Erlang has *no such things* as boolean `true` and `false`. The terms true and false are atoms, but they are integrated well enough into the language you shouldn't have a problem with that as long as you don't expect false and true to mean anything but false and true.

Yes I am pulling my hair. Anyways, gotta finish this.

For comparing other stuff, here's the order.

> *number < atom < reference < fun < port < pid < tuple < list < bit string*

The thing to keep in mind is that number's at the bottom. What's "fun" btw lol.

---
#### Tuples
This is where the fun begins lol.

 Tuples in Erlang are specified using syntax `{<item>,<item2>,....<item_n>}`.
 ```
1> {X,Y} = {2,7}.
{2,7}
2> Coordinates = {X,Y}.
{2,7}
3> {Ordinate,Abcissa} = Coordinates.
{2,7}
 ```
 We can use Tuples to label data and so on.
 
 ---
 ##### Lists
 
 I'll let the author talk. I can't match his enthusiasm. No wonder he wrote the book.
 > Lists are the bread and butter of many functional languages. They're used to solve all kinds of problems and are undoubtedly the most used data structure in Erlang. Lists can contain anything! Numbers, atoms, tuples, other lists; your wildest dreams in a single structure.

So, while discussing lists, this happened.
```
2> [97, 98, 99].
"abc"
```
Weeeellll that's hair pulling level bad. So what exactly happened????

So Strings are just lists in Erlang, with each letter having the value placed in the list. Erlang doesn't return a string when **at least one** of the elements does not represent a letter.

If we want to append or remove certain parts of the array, we can use `++` and `--`.
```
5> [1,2,3]--[1,3].
[2]
```
The operations `++` and `--` are both right associative. That means they start evaluation from the right.
```
9> [1,2,3] -- [1,2] -- [3].
[3]
10> [1,2,3] -- [1,2] -- [2].
[2,3]
```
The list is divided into parts called the head, the first element of the list and the tail which are the rest of the elements of the list. 
The head and the tail can be accessed by using the `hd()` and `tl()` built-in functions.
> built-in functions (BIFs) are usually functions that could not be implemented in pure Erlang, and as such are defined in C, or whichever language Erlang happens to be implemented on (it was Prolog in the 80's). There are still some BIFs that could be done in Erlang but were still implemented in C in order to provide more speed to common operations. One example of this is the `length(List)` function, which will return the (you've guessed it) length of the list passed in as the argument.

We can also access the heads/tails of the lists using pattern matching!
```
6> List = [1,2,3,4].
[1,2,3,4]
7> [Head|Tail] = List.
[1,2,3,4]
8> Head.
1
9> Tail.
[2,3,4]
11> hd(List).
1
```
---
#### List comprehensions

Basically, we can write different "set builders" to make lists of patterns which conform to conditions. Very cool!
```
12> Restraunt_Menu = [{'Chicken Sandwitch', 10},{'Soup', 5},{"coke",2},{"Club Sandwitch",20}].
[{'Chicken Sandwitch',10},
 {'Soup',5},
 {"coke",2},
 {"Club Sandwitch",20}]
13> [{Item, Price} || {Item, Price} <- Restraunt_Menu, Price>=5, Price=<15].
[{'Chicken Sandwitch',10},{'Soup',5}]
```
> The recipe for list comprehensions in Erlang is therefore `NewList = [Expression || Pattern <- List, Condition1, Condition2, ... ConditionN]`. The part `Pattern <- List` is named a Generator expression.
If you want to make the list comprehension recipe more generic, you get: `NewList = [Expression || GeneratorExp1, GeneratorExp2, ..., GeneratorExpN, Condition1, Condition2, ... ConditionM]`.

---
