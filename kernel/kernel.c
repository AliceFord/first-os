#include "../drivers/screen.h"
#include "util.h"

void main() {
    clear_screen();
    for (int i=0; i < 40; i++) {
        char str[255];
        int_to_ascii(i, str);
        kprint_at(str, 79, (i <= 24 ? i : 24));
    }
}
