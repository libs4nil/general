[![https://raw.githubusercontent.com/jpbubble/NIL-isn-t-Lua/master/NIL.png]()](https://github.com/libs4nil/general)

These are just quick libraries written for NIL. Mostly in NIL sometimes in Lua.
All for these libraries do require [NIL](https://raw.githubusercontent.com/jpbubble/NIL-isn-t-Lua/master/NIL.png), but other than that they should work in every engine using Lua 5.1 or 5.2 (and most likely later, as well).

If you don't wish to learn NIL, you don't need to as NIL has been designed to integrate with Lua as seemlessly as possible.

Just type this in Lua to import the LinkedList.nlb library
~~~Lua
LinkedList = NIL.Use("LinkedList")
~~~

And if you want to create a Linked List with this library now, hey it's easy then:
~~~Lua
local MyList = LinkedList.NEW()
MyList.AddLast("Hello")
MyList.AddLast("World")
for s in MyList.Each do
    print(s)
end
--[[

outputs:

Hello
World


]]
~~~


When you are using NIL you can either import the libraries the same way Lua does or use the 'shortcut' "#use"
~~~C
#use LinkedList
~~~



Please note NIL only loads, translates and compiles its libraries ONCE (per Lua state). Using them again with either NIL.Use or #use will only redefine the variable with the previously loaded library. This is a bit similar to 
"require" in "Pure Lua".


The other repositories in this github organisation may be bound to a specific kind of engine, and thus they should only be cloned/downloaded if you actually use those engines. The libraries in this repository are all based on the 
APIs Lua itself provides.


