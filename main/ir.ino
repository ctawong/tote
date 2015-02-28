#include "creep.h"
#include "leg.h"
#include "servos.h"
#include "misc.h"
#include "beep.h"
#include <IRLremote.h>


extern bool power;


void ir_setup() {
    IRLbegin<IR_ALL>(0); // Sensor on PIN 2
    pinMode(13, OUTPUT);
    digitalWrite(13, LOW);
}

void ir_loop() {
    digitalWrite(13, LOW);
}

void IREvent(uint8_t protocol, uint16_t address, uint32_t command) {
    static uint32_t last=0;
    bool led = true;

    if (address != 0xFF00) {
        return; // React only to my remote.
    }

    if (command == 0xFFFFFF) {
        command = last;
    }
    switch (command) {
        case 0xBF40:    // Up arrow.
            creep_dy = min(1.5, creep_dy + 0.25);
            break;
        case 0xE619:    // Down arrow.
            creep_dy = max(-1.5, creep_dy - 0.25);
            break;
        case 0xF807:    // Left arrow.
            creep_rotation = min(PI/90, creep_rotation + PI/360);
            break;
        case 0xF609:    // Right arrow.
            creep_rotation = max(-PI/90, creep_rotation - PI/360);
            break;
        case 0xF30C:    // Rewind.
            creep_spread = max(-10.0, creep_spread - 1);
            break;
        case 0xE718:    // Play/pause.
            creep_spread = 0.0;
            break;
        case 0xA15E:    // Fast forward.
            creep_spread = min(10.0, creep_spread + 1);
            break;
        case 0xF708:    // Channel minus.
            creep_height = max(TIBIA * 0.25, creep_height - 1);
            break;
        case 0xA55A:    // Channel plus.
            creep_height = min(TIBIA * 1.25, creep_height + 1);
            break;
        case 0xE31C:
            creep_height = TIBIA * 0.75;
            break;
        case 0xBD42:    // Volume down.
            creep_dx = max(-1.0, creep_dx - 0.25);
            break;
        case 0xAD52:    // Mute.
            beep_mute = !beep_mute;
            break;
        case 0xB54A:    // Volume up.
            creep_dx = min(1.0, creep_dx + 0.25);
            break;
        case 0xBA45:    // Power.
        case 0xAF50:    // Power.
            power = !power;
            break;
        case 0xBB44:    // Search.
            break;
        case 0xB847:    // Home.
            for (unsigned char leg=0; leg < 4; ++leg) {
                move_leg(
                    leg,
                    ((COXA + FEMUR) / SQRT2),
                    ((COXA + FEMUR) / SQRT2),
                    TIBIA
                );
            }
            break;
        case 0xEA15:    // OK.
            creep_dx = 0.0;
            creep_dy = 0.0;
            creep_rotation = 0.0;
            break;
        default:
            led = false;
    }
    if (led) {
        beep(1319, 50);
        digitalWrite(13, HIGH);
    }
}