tonyc
=====

This is the source code for tonyc, a compiler for the language Tony, implemented for Compilers Course,
8th Semester, National Technical University of Athens.

Authors: Dimitris Komninos, Panagiotis Giannoulis
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

Features
--------

Some features of the Tony language are:

* Simple structure and syntax of statements
* All basic data types including booleans, characters, integers, ... dimensional arrays and *lists*
* Simple functions, by value or by reference parameter passing with left-to-right evaluation.
* Pascal-like variable scope
* Function declaration for mutual recursion
* A small standard library of functions
* Code optimizations from llvm 
* *Dynamic memory allocation* 
* *Garbage Collection*

Notes
-----
* Intermediate code is in form of llvm language with .ll extension. 
* LLVM is used for all kind of optimizations.
* Boehm's Garbage Collector is used in this compiler. 
* Full language specifications can be found at the course's site (in Greek).
