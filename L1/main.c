#include <pic14/pic12f675.h>

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);

void delay (unsigned int tiempo);
void display(unsigned char num);
unsigned char random();
unsigned char dividirby10(unsigned char n);
unsigned char residuo(unsigned char num0, unsigned char divisor, unsigned char num1);

unsigned char main(){
    TRISIO = 0b00001000; 
    ANSEL  = 0x00;  
    CMCON  = 0x07; 
    VRCON  = 0x00; 
    unsigned char num0 = 0; 
    unsigned char num1 = 1;
    unsigned char num2 = 2;
    unsigned char counter = 0;
    unsigned char bandera;

    
    while(1){
        unsigned char sumar = 0;
        num0++;
        if (num0 >= 100){
            num0 = 0;
        }   
        if (num0 >= 9){
            num1 = 0;
            num2 = 9;
        }
        num1 = dividirby10(num0);
        num2 = residuo(num0, 10, num1);

        if(GP3 == 1){
            if(sumar == 0){
                counter++;
                sumar = 1;
            }
            if(bandera == 1){
                counter = 0;
                bandera = 0;
            }
            while (GP3 == 1){
                display(num1);
                GP5 = 1;
                delay(2);
                display(num2);
                GP5 = 0;
                delay(2);
			}
        }
        if(counter == 15){
            display(9);
            GP5 = 0;
			delay(1);
			display(9);
            GP5 = 1;
			delay(1);
            bandera = 1;
        }
        else{
            GP0 = 0;
            GP1 = 1;    
            GP2 = 1;
            GP4 = 1;
            delay(1);
            GP5 = 0;
            delay(1);
            GP5 = 1;
            delay(1);
        } 	

    }
}

void display(unsigned char num){

    if (num == 0){
        GP0 = 0;
        GP1 = 0;
        GP2 = 0;
        GP4 = 0;
    }
    else if (num == 1){
        GP0 = 1;
        GP1 = 0;
        GP2 = 0;
        GP4 = 0;
    }
    else if (num == 2){
        GP0 = 0;
        GP1 = 1;
        GP2 = 0;
        GP4 = 0;
    }
    else if (num == 3){
        GP0 = 1;
        GP1 = 1;
        GP2 = 0;
        GP4 = 0;
    }
    else if (num == 4){
        GP0 = 0;
        GP1 = 0;
        GP2 = 1;
        GP4 = 0;
    }
    else if (num == 5){
        GP0 = 1;
        GP1 = 0;
        GP2 = 1;
        GP4 = 0;
    }

    else if (num == 6){
        GP0 = 0;
        GP1 = 1;
        GP2 = 1;
        GP4 = 0;    
    }
    else if (num == 7){
        GP0 = 1;
        GP1 = 1;
        GP2 = 1;
        GP4 = 0;
    }
    else if (num == 8){
        GP0 = 0;
        GP1 = 0;
        GP2 = 0;
        GP4 = 1;
    }
    else if (num == 9){
        GP0 = 1;
        GP1 = 0;
        GP2 = 0;
        GP4 = 1;
    }

    return;
}


void delay(unsigned int tiempo){
	unsigned int i;
	unsigned int j;

	for(i=0; i<tiempo; i++)
	  for(j=0; j<1275; j++);
}


unsigned char dividirby10(unsigned char n) {
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