######################
#     andi TESTS     #
######################

.globl __start

.text

__start:

test01:
  li a1, 1
  li x1, 0xff00ff00
  andi x30, x1, -241
  li x29, 0xff00ff00
  bne x30, x29, fail

test02:
  li a1, 2
  li x1, 0x0ff00ff0
  andi x30, x1, 240
  li x29, 0x000000f0
  bne x30, x29, fail

test03:
  li a1, 3
  li x1, 0x00ff00ff
  andi x30, x1, 1807
  li x29, 0x0000000f
  bne x30, x29, fail

test04:
  li a1, 4
  li x1, 0xf00ff00f
  andi x30, x1, 240
  li x29, 0x00000000
  bne x30, x29, fail

test05:
  li a1, 5
  li x1, 0xff00ff00
  andi x1, x1, 240
  li x29, 0x00000000
  bne x1, x29, fail

test06:
  li a1, 6
  li x4, 0
label1_test06:
  li x1, 0x0ff00ff0
  andi x30, x1, 1807
  addi x6, x30, 0
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test06
  li x29, 0x00000700
  bne x6, x29, fail

test07:
  li a1, 7
  li x4, 0
label1_test07:
  li x1, 0x00ff00ff
  andi x30, x1, 240
  nop
  addi x6, x30, 0
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test07
  li x29, 0x000000f0
  bne x6, x29, fail

test08:
  li a1, 8
  li x4, 0
label1_test08:
  li x1, 0xf00ff00f
  andi x30, x1, -241
  nop
  nop
  addi x6, x30, 0
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test08
  li x29, 0xf00ff00f
  bne x6, x29, fail

test09:
  li a1, 9
  li x4, 0
label1_test09:
  li x1, 0x0ff00ff0
  andi x30, x1, 1807
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test09
  li x29, 0x00000700
  bne x30, x29, fail

test10:
  li a1, 10
  li x4, 0
label1_test10:
  li x1, 0x00ff00ff
  nop
  andi x30, x1, 240
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test10
  li x29, 0x000000f0
  bne x30, x29, fail

test11:
  li a1, 11
  li x4, 0
label1_test11:
  li x1, 0xf00ff00f
  nop
  nop
  andi x30, x1, 1807
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test11
  li x29, 0x0000000f
  bne x30, x29, fail

test12:
  li a1, 12
  andi x1, x0, 240
  li x29, 0x00000000
  bne x1, x29, fail

test13:
  li a1, 13
  li x1, 0x00ff00ff
  andi x0, x1, 1807
  li x29, 0x00000000
  bne x0, x29, fail

success:
  li a0, 10
  sw a0, 0x64(x0)
  j  success

fail:
  li a0, 17
  sw a0, 0x64(x0)
  j fail
    
