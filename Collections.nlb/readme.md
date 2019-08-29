# Collections library for NIL

This is a quick library with a few more advanced table based classes and stuff than Lua normally provides.

## Is this library Lua compatible?

Yes, but you need Lua 5.1 or higher (Lua 5.2 is actually recommended), and you need NIL. Importing this lirbary then works like this:
~~~lua
NIL = require "NIL"
NIL.Use("Collections")
~~~
Also note that wherever "new" is required in NIL, you can ignore "NIL" in Lua, and then it should work.



## What does this library provide?

### MArray 

The "M" stands for Multi. Lua does not support multi-dimensional arrays, at all. Of course you can do something like this:
~~~lua
a = { {}, {}, {}, {} }
a[3][4] = "Hello World"
~~~
But that's not a true multi-dimensional array, that is an array containing arrays for values. Not the best way to go, as it needs to allocate RAM for every subtable, which is not desirable.
MArray will only use one table, and calculate the proper index out, which is a bit of the 'official approach' to handle this. Creating a new multi-dimension array is as easy as this:
~~~c#
a = new MArray('string',10,12)
~~~
Now you have a 2-dimensional array, with 10 indexes for dimension #1, and 12 for dimension #2, and all values must be strings (values not strings will be converted accordingly).
Please note, unlike normal Lua arrays, MArray uses 0 as its first index, so when an array as 10 indexes, you can use the numbers 0 till 9 as indexes and not 1 till 10.
This was done for two reasons:
- It was already beyond me why Lua used 1 as the first index, and so far, of all the languages I used Lua is the only language to do so
- The calculations I needed to do in order to get the proper index were also easier to perform when starting from 0 (which also explains why most other programming languages use 0).

Now note... Lua doesn't accept this syntax: a[1,3] = "Hello", so you will need to work like this (unfortunately):
~~~lua
a.SetValue(1,3,"Hello")
print(a.GetValue(1,3))
~~~

The MArray class also has the Length method which you can use to get the length of each dimension (in which 1 is the first dimension), which is basically just meaning the maximum length.
It also features the 'Serial' property which can be used for foreach loops.
~~~Lua
for idx,value in a.Serial
   << code >>
end
~~~
idx will then contain an array with all current indexes and value the value in question.

The types you can use are: number, string, function, table, userdata -- which will all have the same function Lua already gives them.
Alternatively you can use:
- var = Will allow ANYTHING
- int = Will only allow integers. Any decimals will likely cause an error.
- delegate = for storing functions
- <classname> = Will check if the values are the requested NIL class... Please note quickmeta won't work, and 'nil' will be taken as valid value.

When requeting undefixed indexes, MArray will contain the default values (empty string for string, 0 for int and number, a new empty table for table, and nil in any other case).



### QuickArray

QuickArray is a function that will return a single dimensional array, which does start from 0, with a fixed length, and which will also check if the type of the values is correct. Basically it's just using MArray with 1 array, but 
as Lua's 1 dimension-only notation is possible then, QuickArray will allow this:
~~~Lua
table qa
qa = QuickArray("string",2)
qa[0] = "Hello"
qa[1] = "World"
print(qa[0],qa[1])
~~~

In Lua 5.2 or later you can use "#" to get the max length in Lua 5.1 you'll need the LEN property for that
~~~Lua
print("Any Lua",qa.LEN)
print("If not Lua 5.2 will be 'nil' or 0, I think (I actually never tried)",#qa)
~~~

Working with ipairs won't do any good, so I included two properties for this:
~~~Lua
for v in qa.Each 
	print(v)
end

for i,v in qa.iPairs
	print(i,v)
end
~~~
(Please note, that I'm writing NIL code now, as when using Lua in stead, you do need to add "do" after the for lines).

Important note... QuickArray is not a standard NIL class, as it didn't lend me the support I needed to do this properly, so the 'new' keyword may NOT be used to create a QuickArray.
