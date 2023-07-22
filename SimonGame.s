.data
sequence:  .byte 0,0,0,0
count:     .word 4
promptA:   .string "Want to play again? If yes, enter 1 else enter any other input"
promptB:   .string "You took longer than allotted time"
promptC:   .string "\n"
promptD:   .string "How many players want to play?"
promptE:   .string "Next up is player"
promptF:   .string "score of players"

.globl main
.text

main:
    # TODO: Before we deal with the LEDs, we need to generate a random
    # sequence of numbers that we will use to indicate the button/LED
    # to light up. For example, we can have 0 for UP, 1 for DOWN, 2 for
    # LEFT, and 3 for RIGHT. Store the sequence in memory. We provided 
    # a declaration above that you can use if you want.
    # HINT: Use the rand function provided to generate each number
    START:
    
        lw t2, count 
        
    LOOPINT:
        li t1, 0 
        la t3, sequence 
         
    WHILE:
        beq t1, t2, LOOPINT2 
        
        li a0, 4 
        jal rand 
        
        sb a0, 0(t3) 
        addi t3, t3, 1    
        addi t1, t1, 1 
        j WHILE
        
   
    # TODO: Now read the sequence and replay it on the LEDs. You will
    # need to use the delay function to ensure that the LEDs light up 
    # slowly. In general, for each number in the sequence you should:
    # 1. Figure out the corresponding LED location and colour
    # 2. Light up the appropriate LED (with the colour)
    # 2. Wait for a short delay (e.g. 500 ms)
    # 3. Turn off the LED (i.e. set it to black)
    # 4. Wait for a short delay (e.g. 1000 ms) before repeating

    LOOPINT2:
        lw s8, count
        li s1, 0 
        la s2, sequence
        li s4, 0 
        li s5, 1 
        li s6, 2 
        li s7, 3
        
    WHILE2:
        beq s1, s8, DONE2
        lb s3, (0)s2     
        
        IF:
            beq s3, s4, THEN1
            beq s3, s5, THEN2
            beq s3, s6, THEN3
            beq s3, s7, ELSE
            
        THEN1:
            li a0, 0x035efc
            li a1, 0
            li a2, 0
            jal setLED
            li a0, 500
            jal delay
            li a0, 0x000000
            li a1, 0
            li a2, 0
            jal setLED
            li a0, 1000
            
            jal delay
            
            j DONE3
            
        THEN2:
            li a0, 0xfc0303
            li a1, 1
            li a2, 0
            jal setLED
            li a0, 500
            jal delay
            li a0, 0x000000
            li a1, 1
            li a2, 0
            jal setLED
            li a0, 1000
            jal delay
            
            j DONE3
            
        THEN3:
            li a0, 0x03fc77
            li a1, 0
            li a2, 1
            jal setLED
            li a0, 500
            jal delay
            li a0, 0x000000
            li a1, 0
            li a2, 1
            jal setLED
            li a0, 1000
            jal delay
            
            j DONE3
            
        ELSE:
            li a0, 0xfcf803
            li a1, 1
            li a2, 1
            jal setLED
            li a0, 500
            jal delay
            li a0, 0x000000
            li a1, 1
            li a2, 1
            jal setLED
            li a0, 1000
            jal delay
            
            j DONE3
            
        DONE3:
            
        addi s2, s2, 1    
        addi s1, s1, 1 
        j WHILE2
        
    DONE2:    
    
    # TODO: Read through the sequence again and check for user input
    # using pollDpad. For each number in the sequence, check the d-pad
    # input and compare it against the sequence. If the input does not
    # match, display some indication of error on the LEDs and exit. 
    # Otherwise, keep checking the rest of the sequence and display 
    # some indication of success once you reach the end.
    
    LOOPINT3:
        lw s8, count 
        li s1, 0 
        la s2, sequence 
        li s4, 5000 # Memory enhancement- stores the 5000 miliseconds for later using to time.
     
    WHILE3:
        beq s1, s8, DONE4 
        lb s3, (0)s2  
        li a7, 30     # Memory enhancement- storing the current time in a0.
        ecall         # The system call.
        mv s5, a0     # Stores the time before key press.
        jal pollDpad
        mv s9, a0
        li a7, 30     # Memory enhancement- storing the current time in a0.
        ecall         # The system call.
        mv s6, a0     # Stores the time after key press.
        sub s7, s6, s5 # stores the time difference to see total time taken for key press.
        blt s7, s4, OK # Checks if time taken is greater than or equal to 5 sec. If yes, the current player's turn will finish. Else, game is allowed to run as usual. 
        li a7, 4
        la a0, promptB #"You took longer than allotted time" is printed. 
        ecall
        li a7, 4
        la a0, promptC
        ecall
        j DONE4        #Chance is finished and user is asked is they want to play again. 
                            
        OK:
        mv a0, s9
        beq s3, a0, ELSE2
             
        THEN4:  
            li a0, 0xdb1212
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0xdb1212
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0xdb1212
            li a1, 1
            li a2, 1
            jal setLED
            
            li a0, 0xdb1212
            li a1, 1
            li a2, 0
            jal setLED
            
            li a0, 1000
            jal delay
            
            li a0, 0x000000
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0x000000
            li a1, 1
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 1
            li a2, 0
            jal setLED  
            
            li a0, 1000
            jal delay
            
            li a0, 0xdb1212
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0xdb1212
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0xdb1212
            li a1, 1
            li a2, 1
            jal setLED
            
            li a0, 0xdb1212
            li a1, 1
            li a2, 0
            jal setLED
            
            li a0, 1000
            jal delay
            
            li a0, 0x000000
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0x000000
            li a1, 1
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 1
            li a2, 0
            jal setLED    
            
            li a0, 1000
            jal delay        
            
            j DONE4
            
        ELSE2:
            li a0, 0x08cc08
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0x08cc08
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0x08cc08
            li a1, 1
            li a2, 1
            jal setLED
            
            li a0, 0x08cc08
            li a1, 1
            li a2, 0
            jal setLED
            
            li a0, 1000
            jal delay
            
            li a0, 0x000000
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0x000000
            li a1, 1
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 0
            li a2, 1
            jal setLED

            li a0, 0x000000
            li a1, 1
            li a2, 0
            jal setLED  
            
            li a0, 1000
            jal delay
            
            # j DONE5
            
        DONE5:
            
        addi s2, s2, 1  
        addi s1, s1, 1 
        j WHILE3
        
    DONE4:
          
    # TODO: Ask if the user wishes to play again and either loop back to
    # start a new round or terminate, based on their input.
 
        li a7, 4
        la a0, promptA
        ecall
        li a7, 4
        la a0, promptC
        ecall
        li s1, 1 
        call readInt
        mv t0, a0
        beq t0, s1, START
 
exit:
    li a7, 10
    ecall
    
    
# --- HELPER FUNCTIONS ---
# Feel free to use (or modify) them however you see fit

readInt:
    addi sp, sp, -12
    li a0, 0
    mv a1, sp
    li a2, 12
    li a7, 63
    ecall
    li a1, 1
    add a2, sp, a0
    addi a2, a2, -2
    mv a0, zero
parse:
    blt a2, sp, parseEnd
    lb a7, 0(a2)
    addi a7, a7, -48
    li a3, 9
    bltu a3, a7, error
    mul a7, a7, a1
    add a0, a0, a7
    li a3, 10
    mul a1, a1, a3
    addi a2, a2, -1
    j parse
parseEnd:
    addi sp, sp, 12
    ret

error:
    li a7, 93
    li a0, 1
    ecall

     
# Takes in the number of milliseconds to wait (in a0) before returning
delay:
    mv t0, a0
    li a7, 30
    ecall
    mv t1, a0
delayLoop:
    ecall
    sub t2, a0, t1
    bgez t2, delayIfEnd
    addi t2, t2, -1
delayIfEnd:
    bltu t2, t0, delayLoop
    jr ra

# Takes in a number in a0, and returns a (sort of) random number from 0 to
# this number (exclusive)
rand:
    mv t0, a0
    li a7, 30
    ecall
    remu a0, a0, t0
    jr ra
    
# Takes in an RGB color in a0, an x-coordinate in a1, and a y-coordinate
# in a2. Then it sets the led at (x, y) to the given color.
setLED:
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    li t1, LED_MATRIX_0_BASE
    add t0, t1, t0
    sw a0, (0)t0
    jr ra
    
# Polls the d-pad input until a button is pressed, then returns a number
# representing the button that was pressed in a0.
# The possible return values are:
# 0: UP
# 1: DOWN
# 2: LEFT
# 3: RIGHT
pollDpad:
    mv a0, zero
    li t1, 4
pollLoop:
    bge a0, t1, pollLoopEnd
    li t2, D_PAD_0_BASE
    slli t3, a0, 2
    add t2, t2, t3
    lw t3, (0)t2
    bnez t3, pollRelease
    addi a0, a0, 1
    j pollLoop
pollLoopEnd:
    j pollDpad
pollRelease:
    lw t3, (0)t2
    bnez t3, pollRelease
pollExit:
    jr ra
