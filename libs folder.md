# What is this "Libs/" folder?


You may see some #use commands here referring to "libs".
This is because all these libraries were primarily written to be used in Bubble, and my Bubble building tool has a dependency detection routine. As soon as #use refers to anything in the "Libs" folder, it will be important and be placed in the "Libs/" folder within the project JCR6 file the builder creates. For NIL itself, "Libs/" has no other value just for being a directory like any other.
