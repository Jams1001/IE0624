#include <stdio.h>
unsigned char divu10(unsigned char n);
unsigned char residuo(unsigned char num0, unsigned char divisor, unsigned char num1);


void hex_digits(void)
{
   unsigned char uc = 0xAB;
   unsigned char nyb_hi = uc >> 4;
   unsigned char nyb_lo = uc & 0xF;

   printf("High nybble: 0x%X, low: 0x%X\n", nyb_hi, nyb_lo);
}



void decimal_digits(void)
{
   unsigned char uc = 15;
   unsigned char d1 = divu10(uc);
   unsigned char d2 = residuo(uc, 10, d1);
   //unsigned char d2 = uc % 10;

   printf("First digit: %u, second: %u\n", d1, d2);
}

int main(void)
{
   hex_digits();
   decimal_digits();

   return 0;
}

unsigned char divu10(unsigned char n) {
  unsigned char q, r;
  q = (n >> 1) + (n >> 2);
  q = q + (q >> 4);
  q = q + (q >> 8);
  q = q + (q >> 16);
  q = q >> 3;
  r = n - (((q << 2) + q) << 1); return q + (r > 9);
}

unsigned char residuo(unsigned char num0, unsigned char divisor, unsigned char num1) {
    unsigned char r; 
    r = num0 - num1*divisor;
    return r;
}