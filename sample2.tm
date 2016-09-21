* TINY Compilation to TM Code
* File: /home/samirsouza/Code/Compiladores_tiny/sample2.tm
* Standard prelude:
      0:     LD  6,0(0) 	load maxaddress from location 0
      1:     ST  0,0(0) 	clear location 0
* End of standard prelude.
      2:     IN  0,0,0 	read integer value
      3:     ST  0,0(5) 	read: store value
* -> if
* -> Op
* -> Const
      4:    LDC  0,0(0) 	load const
* <- Const
      5:     ST  0,0(6) 	op: push left
* -> Id
      6:     LD  0,0(5) 	load id value
* <- Id
      7:     LD  1,0(6) 	op: load left
      8:    SUB  0,1,0 	op <
      9:    JLT  0,2(7) 	br if true
     10:    LDC  0,0(0) 	false case
     11:    LDA  7,1(7) 	unconditional jmp
     12:    LDC  0,1(0) 	true case
* <- Op
* if: jump to else belongs here
* -> assign
* -> Const
     14:    LDC  0,2(0) 	load const
* <- Const
     15:     ST  0,1(5) 	assign: store value
* <- assign
* -> repeat
* repeat: jump after body comes back here
* -> assign
* -> Op
* -> Id
     16:     LD  0,1(5) 	load id value
* <- Id
     17:     ST  0,0(6) 	op: push left
* -> Id
     18:     LD  0,0(5) 	load id value
* <- Id
     19:     LD  1,0(6) 	op: load left
     20:    MUL  0,1,0 	op *
* <- Op
     21:     ST  0,1(5) 	assign: store value
* <- assign
* -> assign
* -> Op
* -> Id
     22:     LD  0,0(5) 	load id value
* <- Id
     23:     ST  0,0(6) 	op: push left
* -> Const
     24:    LDC  0,1(0) 	load const
* <- Const
     25:     LD  1,0(6) 	op: load left
     26:    SUB  0,1,0 	op -
* <- Op
     27:     ST  0,0(5) 	assign: store value
* <- assign
* -> Op
* -> Id
     28:     LD  0,0(5) 	load id value
* <- Id
     29:     ST  0,0(6) 	op: push left
* -> Const
     30:    LDC  0,0(0) 	load const
* <- Const
     31:     LD  1,0(6) 	op: load left
     32:    SUB  0,1,0 	op ==
     33:    JEQ  0,2(7) 	br if true
     34:    LDC  0,0(0) 	false case
     35:    LDA  7,1(7) 	unconditional jmp
     36:    LDC  0,1(0) 	true case
* <- Op
     37:    JEQ  0,-22(7) 	repeat: jmp back to body
* <- repeat
* -> Id
     38:     LD  0,1(5) 	load id value
* <- Id
     39:    OUT  0,0,0 	write ac
* if: jump to endIf belongs here
     13:    JEQ  0,27(7) 	if: jmp to else
     40:    LDA  7,0(7) 	jmp to endIf
* <- if
* -> for
* -> assign
* -> Const
     41:    LDC  0,0(0) 	load const
* <- Const
     42:     ST  0,2(5) 	assign: store value
* <- assign
* for: jump back to begin
* -> Op
* -> Id
     43:     LD  0,2(5) 	load id value
* <- Id
     44:     ST  0,0(6) 	op: push left
* -> Const
     45:    LDC  0,3(0) 	load const
* <- Const
     46:     LD  1,0(6) 	op: load left
     47:    SUB  0,1,0 	op <
     48:    JLT  0,2(7) 	br if true
     49:    LDC  0,0(0) 	false case
     50:    LDA  7,1(7) 	unconditional jmp
     51:    LDC  0,1(0) 	true case
* <- Op
* for: jump to out belongs here
* -> assign
* -> Const
     53:    LDC  0,1(0) 	load const
* <- Const
     54:     ST  0,3(5) 	assign: store value
* <- assign
* -> assign
* -> Op
* -> Id
     55:     LD  0,2(5) 	load id value
* <- Id
     56:     ST  0,0(6) 	op: push left
* -> Const
     57:    LDC  0,1(0) 	load const
* <- Const
     58:     LD  1,0(6) 	op: load left
     59:    ADD  0,1,0 	op +
* <- Op
     60:     ST  0,2(5) 	assign: store value
* <- assign
     61:    LDA  7,-19(7) 	jmp to test
     52:    JEQ  0,9(7) 	for: jmp to test
* -> for
* End of execution.
     62:   HALT  0,0,0 	
