/*
 * Copyright (c) 2014-2016 IBM Corporation.
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

/*
 * This is an example of Activation by Personalization (ABP) - useful in cases
 * where the gateway doesn't support downlink.
 */

#include "lmic.h"
#include "debug.h"

#define SINGLE_CHANNEL_GATEWAY 1
#define USE_CHANNEL 8

//////////////////////////////////////////////////
// CONFIGURATION 
//////////////////////////////////////////////////

// Network Session Key in msb format:
static const u1_t NWKSKEY[16] = { 0x7D, 0x89, 0xA4, 0xFC, 0x1A, 0xD2, 0x24, 0x3A, 0x31, 0xAA, 0xF7, 0xA7, 0x64, 0x60, 0x74, 0x9E };

// Application Session Key in msb format:
static const u1_t APPSKEY[16] = { 0x5B, 0xBE, 0xBB, 0x1C, 0xFE, 0xA5, 0x46, 0x6A, 0x8A, 0x0F, 0x3D, 0xEF, 0x00, 0xD3, 0x92, 0x4D };

// Device Address
static const u4_t DEVADDR = 0x2606176C; 

//////////////////////////////////////////////////
// APPLICATION CALLBACKS
//////////////////////////////////////////////////

// Leave OTAA (over the air activation) callbacks to prevent compiler issues.
// provide application router ID (8 bytes, LSBF)
void os_getArtEui (u1_t* buf) { }
// provide device ID (8 bytes, LSBF)
void os_getDevEui (u1_t* buf) { }
// provide device key (16 bytes)
void os_getDevKey (u1_t* buf) { }

//////////////////////////////////////////////////
// MAIN - INITIALIZATION AND STARTUP
//////////////////////////////////////////////////

unsigned char mydata[] = "Hello World!";

// transmit job
static void transmitfunc (osjob_t* j) {
    // send mydata ("Hello World");
    LMIC_setTxData2(1, mydata, sizeof(mydata)-1, 0);
    // reschedule job in 30 seconds
    os_setTimedCallback(j, os_getTime()+sec2osticks(30), transmitfunc);
}

// application entry point
int main () {
    osjob_t initjob;

    // initialize runtime env
    os_init();
    // initialize debug library
    debug_init();
    // reset MAC state
    LMIC_reset();
    // setup session keys for ABP 
    LMIC_setSession (0x1, DEVADDR, NWKSKEY, APPSKEY);

#if SINGLE_CHANNEL_GATEWAY
    // if using a single channel gateway, disable all channels except the 
    // channel defined by USE_CHANNEL to prevent packet loss
    for (int channel = 0; channel < 72; ++channel) {
      if (channel != USE_CHANNEL) LMIC_disableChannel(channel);
    }
#endif    

    // Disable link check validation
    LMIC_setLinkCheckMode(0);
    // TTN uses SF9 for its RX2 window.
    LMIC.dn2Dr = DR_SF9;
    // set date rate and transmit power
    LMIC_setDrTxpow(DR_SF7,14);
    // setup transmit job
    os_setCallback(&initjob, transmitfunc);
    // execute scheduled jobs and events
    os_runloop();
    // (not reached)
    return 0;
}

//////////////////////////////////////////////////
// LMIC EVENT CALLBACK
//////////////////////////////////////////////////

void onEvent (ev_t ev) {
    debug_event(ev);

    switch(ev) {
        case EV_TXCOMPLETE:
            if (LMIC.txrxFlags & TXRX_ACK) 
                debug_str("Received ACK\r\n");
            if (LMIC.dataLen) {
                debug_str("Received payload of 0x");
                debug_hex(LMIC.dataLen);
                debug_str("bytes\r\n");
            }
    }
}
