tonyc
=====

This is the source code for tonyc, a compiler for the language Tony, implemented for Compilers Course,
8th Semester, National Technical University of Athens (Spring 2019-2020).

## :busts_in_silhouette: Authors

 * Dimitris Komninos ([LightingSpider](https://github.com/LightingSpider))
 * Panagiotis Giannoulis ([pangiann](https://github.com/pangiann))
 
 
Course info and details: http://courses.softlab.ntua.gr/compilers/2020a/

* [Licence](#licence)
* [Dependencies](#dependencies)
* [Installing](#installing)
* [Usage](#usage)
* [Features](#features)
* [Notes](#notes)

Licence
-------

This program is distributed under the GPL, version 3 or later. Please see
the COPYING file for details.

Dependencies
------------

In order to use the tool, you need the following programs:

1. **OCaml**

	Download the latest release from the [official website](https://ocaml.org/), or
	from your package manager.

2. **Menhir**

3. **llvm 6.0.0 version, and ocaml bindings**

      Probably you'll need to install the following packages: 

      * cmake
      * m4 
      * pkg-config

4. **camlp5** 

5. **clang**

6. **libgc-dev**

Installing
----------

* Download tonyc's sources or clone this repository:

		git clone https://github.com/pangiann/tonyc.git

* For a default build:
    
		make depend && make 

Usage
-----

* If you want to compile a .tony file and produce the executable file, use:

		./tonyc [-O] <your-file>

* Alternatively, if you just want to read from stdin and produce intermediate/final code to stdout, use:

		./tonyc [-O][-i|-f]
    
* -O flag stands for optimization purposes    


#### Compile tony programs

For instance assume that you have the following tony program under `example.tony`

```pascal
def main():
	int i
	for i := 0; i < 10; i := i + 1:
		puti(i)
		puts(" ")
	end
	puts("\n")
end
```

which prints the numbers 0 to 9. Running

```bash
./tonyc example.tony
```

will produce IR code at `example.ll` , the object file at `example.s` and the final (linked) executable at `example`.  If you specify the flag `-i` then the program should be read from `stdin` and the IR will be emitted to `stdout` . So the tony compiler should be called as 

```bash
./tonyc -i <example.tony >example.ll
```

### Library 

In order to use the library functions, file lib.a must be in the same folder with all the other files (as it is right now). But, if you want to install the latest 
vesrion, you have to follow these steps:

 * Download the github repository of the library functions created by [abentopoulos](https://github.com/abenetopoulos)
    ```bash
    git clone https://github.com/abenetopoulos/edsger_lib.git 
    ```
 
 * Then, to build (as mentioned in github repo).
        
   ```bash	
   ./libs.sh
   ```
 
 * A lib.a file will be produced, move it in tonyc's folder.
 
 
 
 * Last step is to change the name of symbols 
    ```bash
    ./change.sh
    ```

Features
--------

Some features of the Tony language are:

* Simple structure and syntax of statements
* All basic data types including booleans, characters, integers, one/multi dimensional arrays and *lists*
* Simple functions, by value or by reference parameter passing with left-to-right evaluation.
* Pascal-like variable scope
* Function declaration for mutual recursion
* A small standard library of functions
* Code optimizations 
* *Dynamic memory allocation* 
* *Garbage Collection*

Notes
-----
* Intermediate code is in form of llvm language with .ll extension. 
* LLVM is used for all kind of optimizations.
* Boehm's Garbage Collector is used in this compiler. 
* Full language specifications can be found at the course's site (in Greek).
