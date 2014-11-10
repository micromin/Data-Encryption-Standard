# In order to run the DES algorithm, just put the ascii code of the KEY and Message in the map_key and map_msg, respectively.

# by amin faiz khadem

#ASCII TABLE:=

# 48=0    49=1    50=2
# 51=3    52=4    53=5    54=6    55=7    56=8    57=9    58=:    59=;    60=<
# 61==    62=>    63=?    64=@    65=A    66=B    67=C    68=D    69=E    70=F
# 71=G    72=H    73=I    74=J    75=K    76=L    77=M    78=N    79=O    80=P
# 81=Q    82=R    83=S    84=T    85=U    86=V    87=W    88=X    89=Y    90=Z
# 91=[    92=\    93=]    94=^    95=_    96=`    97=a    98=b    99=c    100=d
# 101=e   102=f   103=g   104=h   105=i   106=j   107=k   108=l   109=m   110=n
# 111=o   112=p   113=q   114=r   115=s   116=t   117=u   118=v   119=w   120=x
# 121=y   122=z 


.data
###############################################################################

##ascii form####INPUT##########################################################

	map_key: .byte 56,98,121,116,101,107,101,121 #enter ascii form of key input ex. "8bytekey" enter 56,98,121,116,101,107,101,121

	map_msg: .byte 109,101,115,115,97,103,101,46 #enter ascii form of msg input ex. "message." enter 109,101,115,115,97,103,101,46

###############################################################################
	map_pSUBKEY: .byte 	 14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32
	map_pKEY: .byte 	 57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4
	map_pIP: .byte 		 58,50,42,34,26,18,10,2,60,52,44,36,28,20,12,4,62,54,46,38,30,22,14,6,64,56,48,40,32,24,16,8,57,49,41,33,25,17,9,1,59,51,43,35,27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,39,31,23,15,7
	map_finalIP: .byte       40,8,48,16,56,24,64,32,39,7,47,15,55,23,63,31,38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29,36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27,34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25
	map_funcE: .byte	 32,1,2,3,4,5,4,5,6,7,8,9,8,9,10,11,12,13,12,13,14,15,16,17,16,17,18,19,20,21,20,21,22,23,24,25,24,25,26,27,28,29,28,29,30,31,32,1
	map_lastP: .byte         16,7,20,21,29,12,28,17,1,15,23,26,5,18,31,10,2,8,24,14,32,27,3,9,19,13,30,6,22,11,4,25
	map_S: .byte		 14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7,0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8,4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0,15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13,15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9,10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1,13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7,	1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12,7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15,13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9,10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4,3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14,2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3,12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11,10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,	9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13,4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1,13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6,1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2,6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12,13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7,1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11

.text 
	.align 2
	.globl main

main:

#li $a1,945977716	#keyr
#li $a0,1701537145	#keyl

#li $a2,1634166062	#msgr
#li $a3, 1835365235	#msgl


li $t0,7
lb $a0,map_key($t0)

li $t0,6
lb $t0,map_key($t0)
sll $t0,$t0,8
add $a0,$a0,$t0

li $t0,5
lb $t0,map_key($t0)
sll $t0,$t0,16
add $a0,$a0,$t0

li $t0,4
lb $t0,map_key($t0)
sll $t0,$t0,24
add $a0,$a0,$t0




li $t0,3
lb $a1,map_key($t0)

li $t0,2
lb $t0,map_key($t0)
sll $t0,$t0,8
add $a1,$a1,$t0


li $t0,1
lb $t0,map_key($t0)
sll $t0,$t0,16
add $a1,$a1,$t0

li $t0,0
lb $t0,map_key($t0)
sll $t0,$t0,24
add $a1,$a1,$t0


#------


li $t0,7
lb $a2,map_msg($t0)

li $t0,6
lb $t0,map_msg($t0)
sll $t0,$t0,8
add $a2,$a2,$t0

li $t0,5
lb $t0,map_msg($t0)
sll $t0,$t0,16
add $a2,$a2,$t0

li $t0,4
lb $t0,map_msg($t0)
sll $t0,$t0,24
add $a2,$a2,$t0


li $t0,3
lb $a3,map_msg($t0)

li $t0,2
lb $t0,map_msg($t0)
sll $t0,$t0,8
add $a3,$a3,$t0

li $t0,1
lb $t0,map_msg($t0)
sll $t0,$t0,16
add $a3,$a3,$t0

li $t0,0
lb $t0,map_msg($t0)
sll $t0,$t0,24
add $a3,$a3,$t0


jal cipher1

j exit


#get Bit---------------------------------------------------

#$a1		 #loc
#$a0		 #i
#jal getbit


#int getB(int i ,int loc){
#	i=i>>31-(loc-1);
#	return i&1;
#}

getbit:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

li $v1,0

addi $s7,$ra,0

addi $a1,$a1,-1
sub $a1,$zero,$a1
addi $a1,$a1,31

srl $a0,$a0,$a1
andi $a0,$a0,1
add $v1,$zero,$a0

addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
jr $ra
#OutPut:=v1
#----------------------------------------------------------






#set Bit---------------------------------------------------

#$a2	 #loc
#$a1	 #in
#$a0     #i
#jal setbit

#void setB(int &i , int in,int loc){
#	int hl=0;
#	hl=1<<31-(loc-1);
#	if (in)
#		i=i|hl;
#	else 
#		i=i&~hl;
#}


setbit:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


li $v1,0

addi $s7,$ra,0

addi $a2,$a2,-1
sub $a2,$zero,$a2
addi $a2,$a2,31
li $t0,1
sll $a2,$t0,$a2
bne $a1,$zero,setbit_or
j setbit_and


setbit_or:
or $v1,$a0,$a2
j setbit_ex

setbit_and:
nor $a2,$a2,0
and $v1,$a0,$a2

setbit_ex:

addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra

#OutPut:=v1
#----------------------------------------------------------




#get Value-------------------------------------------------

#$a0		 #e
#$a1		 #b
#$a2		 #in

#jal getV

#int getV(int in,int b,int e){
#	int sum=0;
#	int t=0;
#	for (int i=e;i>=b;i--){
#		sum+=getB(in,i)<<t;
#		t+=1;
#	}
#	return sum;
#}

getV:
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s7,$ra,0

li $t3,0 #sum
li $t0,0 #t
add $t1,$a0,$zero #i

getV_check:
slt $t2,$t1,$a1
bne $t2,$zero,getV_exit

getV_loop:

#getB() ---------

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $a1,$t1,0		 #loc
addi $a0,$a2,0		 #in

jal getbit


#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

#end getbit-------

sll $v1,$v1,$t0

add $t3,$t3,$v1
addi $t0,$t0,1
addi $t1,$t1,-1
j getV_check

getV_exit:

addi $ra,$s7,0

add $v1,$zero,$t3



#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra

#OutPut:=v1
#----------------------------------------------------------



#shiftL----------------------------------------------------

#$s0		 #rep
#$s1		 #size
#$s2		 #inp

#jal shiftL

#int shiftL(int inp,int size,int rep){
#	for (int i=0;i<rep;i++){
#	int bit=0;
#	bit=getB(inp,1);
#	bit=bit<<32-size;
#	inp=inp<<1;
#	inp=inp|bit;
#	}
#	return inp;
#}

shiftL:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------
addi $s7,$ra,0

li $t0,0 #i

shiftL_check:
slt $t2,$t0,$s0
beq $t2,$zero,shiftL_exit

shiftL_loop:
li $t2,0 #bit=0

li $t4,1
#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t4,0		 #loc
addi $a0,$s2,0		 #in

jal getbit

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------


add $t2,$t2,$v1 #bit=getB(inp,1);

sub $t3,$zero,$s1 #-size;
addi $t3,$t3,32   #32-size;	
sll $t2,$t2,$t3

sll $s2,$s2,$t4
or $s2,$s2,$t2

addi $t0,$t0,1 #i+=1
j shiftL_check

shiftL_exit:
add $v1,$zero,$s2

addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra

#OutPut:=v1
#----------------------------------------------------------


#pKEY----------------------------------------------------


#$s0		 #l
#$s1		 #r

#jal pKEY

#void pKEY(int &l,int &r){
#	int map[56]={57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4};
#	int hl=l;
#	int hr=r;
#	for (int t=0;t<56;t++){
#		if (map[t]>32){
#			if (t>27){
#				setB(hr,getB(r,map[t]-32),t-27);	
#			}
#			else{ 
#				setB(hl,getB(r,map[t]-32),t+1);
#			}
#		}
#		else{ 
#			if (t>27){
#				setB(hr,getB(l,map[t]),t-27);	
#			}
#			else{ 
#				setB(hl,getB(l,map[t]),t+1);
#			}
#		}
#	
#	}
#	r=hr;
#	l=hl;
#
#	r=r>>4;
#	r=r<<4;
#	l=l>>4;
#	l=l<<4;
#}

pKEY:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s7,$ra,0

add $t5,$s0,$zero	#hl
add $t6,$s1,$zero	#hr

li $t8,0 #t
li $t1,0 #map[t]

pKEY_check:
slt $t2,$t8,56
beq $t2,$zero,pKEY_exit

pKEY_loop:
lb $t1,map_pKEY($t8) #map[t]

li $t7,32
slt $t2,$t7,$t1
beq $t2,$zero,pKEY_get_l

pKEY_get_r:

addi $t3,$t1,-32

li $t7,27
slt $t2,$t7,$t8
beq $t2,$zero,pKEY_get_r_set_l

pKEY_get_r_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------


addi $t3,$t8,-27

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0


jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0
j pkey_ex

pKEY_get_r_set_l:


#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0


jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------




ori $t5,$v1,0

j pkey_ex

pKEY_get_l:

addi $t3,$t1,0
li $t7,27
slt $t2,$t7,$t8
beq $t2,$zero,pKEY_get_l_set_l

pKEY_get_l_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------




ori $t7,$v1,0
addi $t3,$t8,-27

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0


jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0

j pkey_ex

pKEY_get_l_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------
addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0


jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0
j pkey_ex

pkey_ex:
addi $t8,$t8,1 #i+=1
j pKEY_check

pKEY_exit:

add $ra,$zero,$s7
add $s5,$zero,$t6	 #r
add $s6,$zero,$t5 	#l

srl $v0,$s5,4 		#r
sll $v0,$v0,4

srl $v1,$s6,4		#l
sll $v1,$v1,4


addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0,v1
#----------------------------------------------------------









#pSUBKEY----------------------------------------------------

#$s0		 #l
#$s1		 #r

#jal pSUBKEY

#void pSUBKEY(int &l,int &r){
#	int map[48]={14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32
#	};
#	int hl=l;
#	int hr=r;
#	for (int t=0;t<48;t++){
#		if (map[t]>28){
#			if (t>23){
#				setB(hr,getB(r,map[t]-28),t-23);	
#			}
#			else{ 
#				setB(hl,getB(r,map[t]-28),t+1);
#			}
#		}
#		else{ 
#			if (t>23){
#				setB(hr,getB(l,map[t]),t-23);	
#			}
#			else{ 
#				setB(hl,getB(l,map[t]),t+1);
#			}
#		}
#	
#	}
#	r=hr;
#	l=hl;
#
#	r=r>>8;
#	r=r<<8;
#	l=l>>8;
#	l=l<<8;
#}

pSUBKEY:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s7,$ra,0

add $t5,$s0,$zero	#hl
add $t6,$s1,$zero	#hr

li $t8,0 #t
li $t1,0 #map[t]

pSUBKEY_check:
slt $t2,$t8,48
beq $t2,$zero,pSUBKEY_exit

pSUBKEY_loop:
lb $t1,map_pSUBKEY($t8) #map[t]

li $t7,28
slt $t2,$t7,$t1
beq $t2,$zero,pSUBKEY_get_l

pSUBKEY_get_r:

addi $t3,$t1,-28

li $t7,23
slt $t2,$t7,$t8
beq $t2,$zero,pSUBKEY_get_r_set_l

pSUBKEY_get_r_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,-23

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0
j pSUBKEY_ex

pSUBKEY_get_r_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0

j pSUBKEY_ex

pSUBKEY_get_l:

addi $t3,$t1,0
li $t7,23
slt $t2,$t7,$t8
beq $t2,$zero,pSUBKEY_get_l_set_l

pSUBKEY_get_l_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

ori $t7,$v1,0
addi $t3,$t8,-23

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$t7,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0

j pSUBKEY_ex

pSUBKEY_get_l_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0
j pSUBKEY_ex

pSUBKEY_ex:
addi $t8,$t8,1 #i+=1
j pSUBKEY_check

pSUBKEY_exit:

add $s5,$zero,$t6	 #r
add $s6,$zero,$t5 	#l

srl $v0,$s5,8
sll $v0,$v0,8

srl $v1,$s6,8
sll $v1,$v1,8

addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0,v1
#----------------------------------------------------------








#pIP----------------------------------------------------

#$s0		 #l
#$s1		 #r

#jal pIP

#void pIP(int &l,int &r){
#	int map[64]={58,50,42,34,26,18,10,2,60,52,44,36,28,20,12,4,62,54,46,38,30,22,14,6,64,56,48,40,32,24,16,8,57,49,41,33,25,17,9,1,59,51,43,35,27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,39,31,23,15,7};
#	int hl=l;
#	int hr=r;
#	for (int t=0;t<64;t++){
#		if (map[t]>32){
#			if (t>31){
#				setB(hr,getB(r,map[t]-32),t-31);	
#			}
#			else{ 
#				setB(hl,getB(r,map[t]-32),t+1);
#			}
#		}
#		else{ 
#			if (t>31){
#				setB(hr,getB(l,map[t]),t-31);	
#			}
#			else{ 
#				setB(hl,getB(l,map[t]),t+1);
#			}
#		}
#	
#	}
#	r=hr;
#	l=hl;
#}

pIP:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

add $t5,$s0,$zero	#hl
add $t6,$s1,$zero	#hr

addi $s7,$ra,0

li $t8,0 #t
li $t1,0 #map[t]

pIP_check:
slt $t2,$t8,64
beq $t2,$zero,pIP_exit

pIP_loop:
lb $t1,map_pIP($t8) #map[t]

li $t7,32
slt $t2,$t7,$t1
beq $t2,$zero,pIP_get_l

pIP_get_r:

addi $t3,$t1,-32

li $t7,31
slt $t2,$t7,$t8
beq $t2,$zero,pIP_get_r_set_l

pIP_get_r_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,-31

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0
j pIP_ex

pIP_get_r_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0

j pIP_ex

pIP_get_l:

addi $t3,$t1,0
li $t7,31
slt $t2,$t7,$t8
beq $t2,$zero,pIP_get_l_set_l

pIP_get_l_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

ori $t7,$v1,0

addi $t3,$t8,-31


#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$t7,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0

j pIP_ex

pIP_get_l_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0
j pIP_ex


pIP_ex:
addi $t8,$t8,1 #i+=1
j pIP_check

pIP_exit:

addi $ra,$s7,0

add $v0,$zero,$t6	 #r
add $v1,$zero,$t5 	#l

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0,v1
#----------------------------------------------------------




#finalIP----------------------------------------------------

#$s0		 #l
#$s1		 #r

#jal finalIP

#void finalIP(int &l,int &r){
#	int map[64]={58,50,42,34,26,18,10,2,60,52,44,36,28,20,12,4,62,54,46,38,30,22,14,6,64,56,48,40,32,24,16,8,57,49,41,33,25,17,9,1,59,51,43,35,27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,39,31,23,15,7};
#	int hl=l;
#	int hr=r;
#	for (int t=0;t<64;t++){
#		if (map[t]>32){
#			if (t>31){
#				setB(hr,getB(r,map[t]-32),t-31);	
#			}
#			else{ 
#				setB(hl,getB(r,map[t]-32),t+1);
#			}
#		}
#		else{ 
#			if (t>31){
#				setB(hr,getB(l,map[t]),t-31);	
#			}
#			else{ 
#				setB(hl,getB(l,map[t]),t+1);
#			}
#		}
#	
#	}
#	r=hr;
#	l=hl;
#}

finalIP:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

add $t5,$s0,$zero	#hl
add $t6,$s1,$zero	#hr

addi $s7,$ra,0

li $t8,0 #t
li $t1,0 #map[t]

finalIP_check:
slt $t2,$t8,64
beq $t2,$zero,finalIP_exit

finalIP_loop:
lb $t1,map_finalIP($t8) #map[t]

li $t7,32
slt $t2,$t7,$t1
beq $t2,$zero,finalIP_get_l

finalIP_get_r:

addi $t3,$t1,-32

li $t7,31
slt $t2,$t7,$t8
beq $t2,$zero,finalIP_get_r_set_l

finalIP_get_r_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,-31

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0
j finalIP_ex

finalIP_get_r_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0

j finalIP_ex

finalIP_get_l:

addi $t3,$t1,0
li $t7,31
slt $t2,$t7,$t8
beq $t2,$zero,finalIP_get_l_set_l

finalIP_get_l_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

ori $t7,$v1,0

addi $t3,$t8,-31


#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$t7,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0

j finalIP_ex

finalIP_get_l_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0
j finalIP_ex


finalIP_ex:
addi $t8,$t8,1 #i+=1
j finalIP_check

finalIP_exit:

addi $ra,$s7,0

add $v0,$zero,$t6	 #r
add $v1,$zero,$t5 	#l

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0,v1
#----------------------------------------------------------



#funcE----------------------------------------------------


#$s0		 #l
#$s1		 #r

#jal funcE

#void funcE(int &l,int &r){
#	int map[48]={32,1,2,3,4,5,4,5,6,7,8,9,8,9,10,11,12,13,12,13,14,15,16,17,16,17,18,19,20,21,20,21,22,23,24,25,24,25,26,27,28,29,28,29,30,31,32,1};
#	int hl=l;
#	int hr=r;
#	for (int t=0;t<48;t++){
#			if (t>23){
#				setB(hr,getB(r,map[t]),t-23);	
#			}
#			else{ 
#				setB(hl,getB(r,map[t]),t+1);
#			}	
#	}
#	r=hr;
#	l=hl;
#
#	r=r>>8;
#	r=r<<8;
#	l=l>>8;
#	l=l<<8;
#}

funcE:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

add $t5,$s0,$zero	#hl
add $t6,$s1,$zero	#hr

addi $s7,$ra,0

li $t8,0 #t
li $t1,0 #map[t]

funcE_check:
slt $t2,$t8,48
beq $t2,$zero,funcE_exit

funcE_loop:
lb $t1,map_funcE($t8) #map[t]

funcE_get_r:
addi $t3,$t1,0
li $t7,23
slt $t2,$t7,$t8
beq $t2,$zero,funcE_get_r_set_l

funcE_get_r_set_r:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,-23

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t6,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t6,$v1,0
j funcE_ex

funcE_get_r_set_l:

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s1,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0


j funcE_ex

funcE_ex:
addi $t8,$t8,1 #i+=1
j funcE_check

funcE_exit:

add $ra,$zero,$s7
add $s5,$zero,$t6	 #r
add $s6,$zero,$t5 	#l

srl $v0,$s5,8
sll $v0,$v0,8

srl $v1,$s6,8
sll $v1,$v1,8

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0,v1
#----------------------------------------------------------



#lastP----------------------------------------------------

#$s0		 #s

#jal lastP

#int lastP(int s){
#	int map[32]={16,7,20,21,29,12,28,17,1,15,23,26,5,18,31,10,2,8,24,14,32,27,3,9,19,13,30,6,22,11,4,25};
#	int ss=0;
#	for (int t=0;t<32;t++){
#		setB(ss,getB(s,map[t]),t+1);	
#	}
#	return ss;
#}

lastP:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

add $t5,$s0,$zero	#ss

addi $s7,$ra,0

li $t8,0 #t
li $t1,0 #map[t]

lastP_check:
slt $t2,$t8,32
beq $t2,$zero,lastP_exit

lastP_loop:
lb $t1,map_lastP($t8) #map[t]

lastP_get_r:
addi $t3,$t1,0

#getB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t3,0		 #loc
addi $a0,$s0,0		 #in

jal getbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end getbit-------

addi $t3,$t8,1

#setB() ---------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a2,$t3,0
addi $a1,$v1,0
addi $a0,$t5,0

jal setbit
#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
#end setbit-------

ori $t5,$v1,0

lastP_ex:
addi $t8,$t8,1 #i+=1
j lastP_check

lastP_exit:

add $ra,$s7,0
add $v0,$zero,$t5 	#ss

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v0
#----------------------------------------------------------

#funcS----------------------------------------------------
#$a0		 #num
#$a1		 #row
#$a2		 #column

funcS:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s7,$ra,0

#int funcS(int num,int row,int column){
#	int S[512]={14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7,
#				0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8,
#				4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0,
#				15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13,
#				15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,
#				3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,
#				0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,
#				13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9,
#				10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,
#				13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1,
#				13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7,
#				1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12,
#				7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15,
#				13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9,
#				10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4,
#				3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14,
#				2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,
#				14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,
#				4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,
#				11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3,
#				12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11,
#				10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,
#				9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,
#				4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13,
#				4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1,
#				13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6,			
#				1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2,
#				6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12,
#				13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7,
#				1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,
#				7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,
#				2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11};
#	return (S[(num-1)*64+row*16+column]);
#}

addi $a0,$a0,-1
sll $a0,$a0,6
sll $a1,$a1,4
add $a0,$a0,$a1
add $a0,$a0,$a2
lb $v1,map_S($a0)

addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra

#OutPut:=v1
#----------------------------------------------------------

#funcF----------------------------------------------------

funcF:
#$a0 	#r
#$a1 	#kl
#$a2 	#kr

#jal funcF

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s6,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------
#int  funcF(int r,int kl,int kr){
#	int er=r,el=0;
#	funcE(el,er);
#	kl=kl^el;
#	kr=kr^er;
#	int b=0;
#	int s=0;
#	for (int i=8;i>0;i--){
#		if (i>4){
#			b=getV(kr,i*6-24-5,i*6-24);
#		}else {
#			b=getV(kl,i*6-5,i*6);
#		}
#		int column=getV(b,28,31);
#		int row=getV(getV(b,32,32)|(getV(b,27,27)<<1),30,32);
#		s+=funcS(i,row,column)<<(8-i)*4;
#	}
#	return lastP(s);
#}

addi $s7,$ra,0
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s0,$zero,0
addi $s1,$a0,0

jal funcE

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

xor $a1,$a1,$v0	 #kr
xor $a2,$a2,$v1  #kl

li $s0,0 #s
li $s1,0 #b

li $t8,8 #i

check_funcF:
slt $t2,$zero,$t8
beq $t2,$zero,exit_funcF

loop_funcF:

li $t3,4
slt $t2,$t3,$t8
beq $t2,$zero,do_funcF_2
do_funcF_1:


#b=getV(kr,i*6-24-5,i*6-24);

addi $s0,$a1,0

li $t2,6
mul $t2,$t2,$t8
addi $t2,$t2,-29

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t2,0	 #b
addi $a0,$a1,5	 #e
addi $a2,$s0,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $s1,$v1,0



j funcF_ex

do_funcF_2:


#b=getV(kl,i*6-5,i*6);

addi $s0,$a2,0

li $t2,6
mul $t2,$t2,$t8
addi $t2,$t2,-5

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $a1,$t2,0	 #b
addi $a0,$a1,5	 #e
addi $a2,$s0,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $s1,$v1,0

funcF_ex:

#int column=getV(b,28,31);
#int row=getV(getV(b,32,32)|(getV(b,27,27)<<1),30,32);
#s+=funcS(i,row,column)<<(8-i)*4;

li $t4,0#column
li $t5,0#row
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$zero,28	 #b
addi $a0,$zero,31	 #e
addi $a2,$s1,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $t4,$v1,0#column

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$zero,32	 #b
addi $a0,$zero,32	 #e
addi $a2,$s1,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $t0,$v1,0#column
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$zero,27	 #b
addi $a0,$zero,27	 #e
addi $a2,$s1,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $t1,$v1,0 #column
sll $t1,$t1,1
or $t1,$t1,$t0

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$zero,30	 #b
addi $a0,$zero,32	 #e
addi $a2,$t1,0	 #in

jal getV

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $t1,$v1,0 #row
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a0,$t8,0		 #num
addi $a1,$t1,0		 #row
addi $a2,$t4,0		 #column

jal funcS

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $t1,$v1,0 #funcS

sub $t0,$zero,$t8
addi $t0,$t0,8
sll $t0,$t0,2
sll $t1,$t1,$t0

add $s6,$s6,$t1

addi $t8,$t8,-1
j check_funcF

exit_funcF:

addi $s0,$s6,0	 #s

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $s0,$s0,0		 #num

jal lastP

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $v1,$v0,0
addi $ra,$s7,0

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s6,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

jr $ra


#OutPut:=v1
#---------------------------------------------------------


#CIPHER 1-----------------------------------------------------

cipher1:
addi $s7,$ra,0

#void Cipher(long long int msg,long long int key){
#	int f=0;
#	int keyr=(int)(key);
#	int keyl=(int)(key>>32);
#	int c0=0,d0=0;
#	pKEY(keyl,keyr);
#	c0=keyl;
#	d0=keyr;
#	int kl=0,kr=0;
#	int r0=(int)(msg);
#	int l0=(int)(msg>>32);
#	pIP(l0,r0);


#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------
#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $s0,$a1,0		 #l
addi $s1,$a0,0		 #r

jal pKEY

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
addi $s5,$v0,0  #d0
addi $s4,$v1,0	#c0



#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $s0,$a3,0		 #l
addi $s1,$a2,0		 #r

jal pIP


#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $s3,$v0,0 #r0
addi $s2,$v1,0 #l0


chiper2:
#for (int i=1;i<17;i++){
#		int t=2;
#		if (i==1||i==2||i==9||i==16){
#			t=1;
#		}
#		c0=shiftL(c0,28,t);
#		d0=shiftL(d0,28,t);
#		kl=c0;
#		kr=d0;
#		pSUBKEY(kl,kr);
#		int pl0=l0;
#		l0=r0;
#		r0=pl0^funcF(r0,kl,kr);
#	
#}
li $t9,1
cipher2_check:
slt $t2,$t9,17
beq $t2,$zero,cipher2_exit

cipher2_loop:
li $t7,1
li $t6,1
beq $t9,$t6,cipher2_do
li $t6,2
beq $t9,$t6,cipher2_do
li $t6,9
beq $t9,$t6,cipher2_do
li $t6,16
beq $t9,$t6,cipher2_do
li $t7,2
cipher2_do:

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $s0,$t7,0		 #rep
addi $s1,$zero,28	 #size
addi $s2,$s4,0		 #inp
jal shiftL

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
addi $s4,$v1,0 #c=shiftl

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------



addi $s0,$t7,0		 #rep
addi $s1,$zero,28	 #size
addi $s2,$s5,0		 #inp
jal shiftL


#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------
addi $s5,$v1,0 #d=shiftl



#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


addi $s0,$s4,0		 #kl
addi $s1,$s5,0		 #kr

jal pSUBKEY

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

#$a0 	#r
#$a1 	#kl
#$a2 	#kr



addi $a0,$s3,0		 
addi $a2,$v1,0		
addi $a1,$v0,0

jal funcF

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------


addi $t5,$s2,0
addi $s2,$s3,0

xor $s3,$v1,$t5





addi $t9,$t9,1
j cipher2_check

cipher2_exit:

addi $v1,$s2,0
addi $v0,$s3,0




#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------


#$s0		 #l
#$s1		 #r
addi $s0,$v0,0
addi $s1,$v1,0

jal finalIP

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)
lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------

addi $ra,$s7,0
jr $ra

#OutPut:=v0,v1
#----------------------------------------------------------

exit:

addi $t1,$v0,0

li $v0, 4
la $a0,str
syscall

jal hex

addi $v1,$t1,0

jal hex

j exit2
hex:

li $t5,1
addi $s7,$ra,0
li $t3,0
li $t4,8
hex_check:
slt $t2,$t3,$t4
beq $t2,$zero,hex_exit

hex_do:
addi $s1,$v1,0
addi $s0,$v0,0

#-save--------------------
addi $sp,$sp,-88
sw $s0,84($sp)
sw $s1,80($sp)
sw $s2,76($sp)
sw $s3,72($sp)
sw $s4,68($sp)
sw $s5,64($sp)
sw $s6,60($sp)
sw $s7,56($sp)


sw $t0,52($sp)
sw $t1,48($sp)
sw $t2,44($sp)
sw $t3,40($sp)
sw $t4,36($sp)
sw $t5,32($sp)
sw $t6,28($sp)
sw $t7,24($sp)
sw $t8,20($sp)
sw $t9,16($sp)

sw $a0,12($sp)
sw $a1,8($sp)
sw $a2,4($sp)
sw $a3,0($sp)

#--------------------------

addi $a1,$t5,0	 #b
addi $a0,$a1,3	 #e
addi $a2,$s1,0	 #in

jal getV
aa:
li $t5,10
bne $v1,$t5,bb

li $v0, 4
la $a0,al
syscall

j int2

bb:
li $t5,11
bne $v1,$t5,cc

li $v0, 4
la $a0,bl
syscall

j int2


cc:
li $t5,12
bne $v1,$t5,dd

li $v0, 4
la $a0,cl
syscall

j int2

dd:
li $t5,13
bne $v1,$t5,ee

li $v0, 4
la $a0,dl
syscall

j int2

ee:
li $t5,14
bne $v1,$t5,ff

li $v0, 4
la $a0,el
syscall

j int2

ff:
li $t5,15
bne $v1,$t5,int

li $v0, 4
la $a0,fl
syscall

j int2


int:

li $v0,1
move $a0,$v1
syscall

int2:

#-load---------------------
lw $a3,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
lw $a0,12($sp)

lw $t9,16($sp)
lw $t8,20($sp)
lw $t7,24($sp)
lw $t6,28($sp)
lw $t5,32($sp)
lw $t4,36($sp)
lw $t3,40($sp)
lw $t2,44($sp)
lw $t1,48($sp)
lw $t0,52($sp)

lw $s7,56($sp)
lw $s6,60($sp)
lw $s5,64($sp)
lw $s4,68($sp)
lw $s3,72($sp)
lw $s2,76($sp)
lw $s1,80($sp)
lw $s0,84($sp)
addi $sp,$sp,88
#--------------------------


addi $v1,$s1,0
addi $v0,$s0,0

addi $t3,$t3,1
addi $t5,$t5,4

j hex_check

hex_exit:

addi $ra,$s7,0

jal $ra
exit2:
li $v0, 4
la $a0,name
syscall

.data
.align 0


str:
	.asciiz "Cipher Output HEX:=\n"

al:
	.asciiz "a"
bl:
	.asciiz "b"
cl:
	.asciiz "c"
dl:
	.asciiz "d"
el:
	.asciiz "e"
fl:
	.asciiz "f"
name:
	.asciiz "\n.:: by Amin Faiz Khademi ::."