Under Construction note!

#### Lists
- We can choose elements from the end of the list using minus sign. `-1` would be the first last element. `-2` the second last element and so on.
	```python
	list = [1,2,3,4]
	list[-1] # equal to 4
	list[-2] # equal to 3
	```
	- When handling such stuff it's just better to convert the minus to the normal index in our head for better understanding. I genuinely think that's exactly what python does too.
- We can use `:` to slice the list too! Here are some examples:
	```python
	>>> a_list
	['a', 'b', 'mpilgrim', 'z', 'example']
	>>> a_list[1:3] 
	['b', 'mpilgrim']
	>>> a_list[1:-1] 
	['b', 'mpilgrim', 'z']
	>>> a_list[0:3] 
	['a', 'b', 'mpilgrim']
	>>> a_list[:3] 
	['a', 'b', 'mpilgrim']
	>>> a_list[3:] 
	['z', 'example']
	>>> a_list[:] 
	['a', 'b', 'mpilgrim', 'z', 'example']
	```
