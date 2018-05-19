/*
 * Copyright (c) 2018 Craig Peacock
 * All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of the <organization> nor the
 *    names of its contributors may be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <oslmic.h>
#include <lorabase.h>

#include <p24Fxxxx.h>
#include <libpic30.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FCY     12000000

// CONFIG3
#pragma config WPFP = WPFP511           // Write Protection Flash Page Segment Boundary (Highest Page (same as page 170))
#pragma config WPDIS = WPDIS            // Segment Write Protection Disable bit (Segmented code protection disabled)
#pragma config WPCFG = WPCFGDIS         // Configuration Word Code Page Protection Select bit (Last page(at the top of program memory) and Flash configuration words are not protected)
#pragma config WPEND = WPENDMEM         // Segment Write Protection End Page Select bit (Write Protect from WPFP to the last page of memory)

// CONFIG2
#pragma config POSCMOD = HS             // Primary Oscillator Select (HS oscillator mode selected)
#pragma config DISUVREG = OFF           // Internal USB 3.3V Regulator Disable bit (Regulator is disabled)
#pragma config IOL1WAY = ON             // IOLOCK One-Way Set Enable bit (Write RP Registers Once)
#pragma config OSCIOFNC = OFF           // Primary Oscillator Output Function (OSCO functions as CLKO (FOSC/2))
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor (Both Clock Switching and Fail-safe Clock Monitor are disabled)
#pragma config FNOSC = PRI              // Oscillator Select (Primary oscillator (XT, HS, EC))
#pragma config PLL_96MHZ = ON           // 96MHz PLL Disable (Enabled)
#pragma config PLLDIV = DIV12           // USB 96 MHz PLL Prescaler Select bits (Oscillator input divided by 12 (48MHz input))
#pragma config IESO = OFF               // Internal External Switch Over Mode (IESO mode (Two-speed start-up)disabled)

// CONFIG1
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler (1:32,768)
#pragma config FWPSA = PR128            // WDT Prescaler (Prescaler ratio of 1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Standard Watchdog Timer enabled,(Windowed-mode is disabled))
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config ICS = PGx2               // Comm Channel Select (Emulator functions are shared with PGEC2/PGED2)
#pragma config GWRP = OFF               // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF                // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG port is disabled)

u4_t tmr_ticks;

// Initialize the hardware abstraction layer. Configure all components (IO, 
// SPI, TIMER, IRQ) for further use with the hal_xxx() functions.
void hal_init () {
    
	//*************************************
    // Unlock Registers
    //*************************************
    asm volatile (  "MOV #OSCCON, w1 \n"
                    "MOV #0x46, w2 \n"
                    "MOV #0x57, w3 \n"
                    "MOV.b w2, [w1] \n"
                    "MOV.b w3, [w1] \n"
                    "BCLR OSCCON,#6");
    //***************************
    // Configure Input Functions
    // (See Table 10-2)
    //***************************
    RPINR18bits.U1RXR = 23;     // U1_RX Input = RP23/RD2
    RPINR20bits.SDI1R = 0;      // SDI1 Input = RP0/RB0
    RPINR0bits.INT1R = 18;      // DIO0 Input = RP18/RB5
    RPINR1bits.INT2R = 8;       // DIO1 Input = RP8/RB8
    RPINR1bits.INT3R = 9;       // DIO2 Input = RP9/RB9
    //***************************
    // Configure Output Functions
    // (See Table 10-3)
    //***************************
    RPOR11bits.RP22R = 3;       // U1_TX Output = RP22/RD3
    RPOR6bits.RP13R = 8;        // SCK1 Output = RP13/RB2
    RPOR0bits.RP1R = 7;         // SDO1 Output = RP1/RB1

    //*************************************
    // Lock Registers
    //*************************************
    asm volatile (  "MOV #OSCCON, w1 \n"
                    "MOV #0x46, w2 \n"
                    "MOV #0x57, w3 \n"
                    "MOV.b w2, [w1] \n"
                    "MOV.b w3, [w1] \n"
                    "BSET OSCCON, #6" );
    
    __C30_UART=1;           	// Select UART1 for STDIO
    U1BRG = 38;             	// Baud Rate 12MHz/2/(16*9600BPS) - 1
    U1MODEbits.UARTEN = 1;		// Enable UART
  
    AD1PCFG = 0xFFFF; 			// All analog pins are in Digital Mode.
    
    // Set up SPI - 6MHz Clock
    // The SX1276 has a 10MHz Maximum SPI Clock. CPOL=0, CPHA = 0;
    SPI1CON1bits.CKE = 1;       // Data changes on falling edge of clock
    SPI1CON1bits.MSTEN = 1;     // Master Mode
    SPI1CON1bits.SPRE = 6;      // Secondary Prescale 2:1
    SPI1CON1bits.PPRE = 3;      // Primary Prescale 1:1
    SPI1STATbits.SPIEN = 1;     // Enable SPI Module
      
    TRISEbits.TRISE0 = 0; 		// Make LED 1 an output
    TRISEbits.TRISE1 = 0;		// Make LED 2 an output
    TRISEbits.TRISE2 = 0;		// Make LED 3 an output
    TRISEbits.TRISE3 = 0;		// Make LED 4 an output
    
    TRISBbits.TRISB3 = 0;       // NSS Output
    TRISBbits.TRISB4 = 0;       // RESET Output
  
    // Configure Timer 1
    tmr_ticks = 0;
    T1CON = 0;      			// Stop TMR1 and reset control register
    TMR1 = 0x00;    			// Clear contents of timer register
    PR1 = 183;
    IPC0bits.T1IP = 0x01; 		// Setup Timer1 interrupt for desired priority level
    IFS0bits.T1IF = 0; 			// Clear the Timer1 interrupt status flag
    IEC0bits.T1IE = 1; 			// Enable Timer1 interrupts
    T1CONbits.TCKPS = 0b00; 	// 1:8 prescale
    T1CONbits.TGATE = 0;
    T1CONbits.TCS = 0; 			// Source: Internal clock (FOSC/2)
    T1CONbits.TON = 1; 			// Start the Timer

    // Configure Interrupts
    INTCON2bits.INT1EP = 0;     // Interrupt on positive edge (DIO0)
    INTCON2bits.INT2EP = 0;     // Interrupt on positive edge (DIO1)
    INTCON2bits.INT3EP = 0;     // Interrupt on positive edge (DIO2)
    IFS1bits.INT1IF = 0;        // Clear Flag
    IFS1bits.INT2IF = 0;        // Clear Flag
    IFS3bits.INT3IF = 0;        // Clear Flag
    IEC1bits.INT1IE = 1;        // Enable Interrupt
    IEC1bits.INT2IE = 1;        // Enable Interrupt
    IEC3bits.INT3IE = 1;        // Enable Interrupt
    
    printf("PIC24F LMiC Hal Core Initialised\r\n");
    
}

void __attribute__((interrupt, no_auto_psv)) _T1Interrupt(void)
{
    tmr_ticks++;
    IFS0bits.T1IF = 0; //Reset Timer1 interrupt flag and Return from ISR
}

// Perform "fatal failure" action. This function will be called by code 
// assertions on fatal conditions. Possible actions could be HALT or reboot.
void hal_failed () {
    printf("hal_failed()\r\n");
}

// Drive the digital output pins RX and TX (0=receive, 1=transmit).
void hal_pin_rxtx (u1_t val) {

}

// Drive the digital output pin NSS (0=low/selected, 1=high/deselected).
void hal_pin_nss (u1_t val) {
    if (val) LATBbits.LATB3 = 1;
    else     LATBbits.LATB3 = 0;
}

// Control the radio RST pin (0=low, 1=high, 2=floating)
void hal_pin_rst (u1_t val) {
    if (val == 0){
        LATBbits.LATB4 = 0;
        TRISBbits.TRISB4 = 0;
    }
    else if (val == 1){
        LATBbits.LATB4 = 1;
        TRISBbits.TRISB4 = 0;
    }
    else{
        TRISBbits.TRISB4 = 1;
    }
}

// The three input lines DIO0, DIO1 and DIO2 must be configured to trigger an 
// interrupt on the rising edge and the corresponding interrupt handlers must 
// invoke the function radio_irq_handler() and pass the line which generated 
// the interrupt as argument (0, 1, 2).

void __attribute__((interrupt, no_auto_psv)) _INT1Interrupt(void)
{
    radio_irq_handler(0);
    IFS1bits.INT1IF = 0;
}

void __attribute__((interrupt, no_auto_psv)) _INT2Interrupt(void)
{
    radio_irq_handler(1);
    IFS1bits.INT2IF = 0;
}

void __attribute__((interrupt, no_auto_psv)) _INT3Interrupt(void)
{
    radio_irq_handler(2);
    IFS3bits.INT3IF = 0;
}

// Perform 8-bit SPI transaction. Write given byte outval to radio, read byte 
// from radio and return value.
u1_t hal_spi (u1_t outval) {
    unsigned int temp;
    IFS0bits.SPI1IF = 0;    
    SPI1BUF = outval;            
    while(IFS0bits.SPI1IF == 0){}
    temp = SPI1BUF;
    return(temp);
}

// Return 32-bit system time in ticks.
u4_t hal_ticks () {
    return(tmr_ticks);
}

// Busy-wait until specified timestamp (in ticks) is reached.
void hal_waitUntil (u4_t time) {
    while (time < tmr_ticks);
}

// Check and rewind timer for given targettime. Return 1 if targettime is close 
// (not worthwhile programming the timer). Otherwise rewind timer for exact 
// targettime or for full timer period and return 0. The only action required 
// when targettime is reached is that the CPU wakes up from possible sleep 
// states.
u1_t hal_checkTimer (u4_t targettime) {
    
    s4_t diff_ticks = targettime - tmr_ticks;
    
    if (diff_ticks <= 0)
        return 1;
    else        
        return 0;
}

// Disable all CPU interrupts. Might be invoked nested. But will always be 
// followed by matching call to hal_enableIRQs().
void hal_disableIRQs () {
    //printf("hal_disableIRQs()\r\n");
}

// Enable CPU interrupts. When invoked nested, only the outmost invocation 
// actually must enable the interrupts.
void hal_enableIRQs () {
    //printf("hal_enableIRQs()\r\n");
}

// Sleep until interrupt occurs. Preferably system components can be put in 
// low-power mode before sleep, and be re-initialized after sleep.
void hal_sleep () {
	//printf("hal_sleep()\r\n");
}

