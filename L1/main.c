#include <pic14/pic12f675.h>


typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);

void delay (unsigned int tiempo);
void display(int num);
int random();
int size = 3;

int main(){
    TRISIO = 0b00001000; 
    ANSEL  = 0x00;  
    CMCON  = 0x07; 
    VRCON  = 0x00;  
    int num1 = 2;
    int num2 = 1;
    int counter = 0;
    while(1){


        if(GP3 == 1){
            counter = counter + 1;
            while (GP3 == 1){
            display(num1);
            GP5 = 1;
            delay(2);
            display(num2);
            GP5 = 0;
            delay(2);
			}
        } 	

    }
}


void display(int num){

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

    return;
}


void delay(unsigned int tiempo){
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}