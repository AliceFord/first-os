#ifndef UTIL_H
#define UTIL_H

#include "../cpu/types.h"

void memory_copy(s8 *source, s8 *dest, int nbytes);
void int_to_ascii(int n, s8 str[]);

#endif