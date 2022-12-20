#include <stdint.h>

void spin(volatile uint32_t count) {
  while (count--) asm("nop");
}

int main(void) {
	//AHB1ENR PORT A CLOCK ENABLE
  * (volatile uint32_t *) (0x40021014) |= 1<<17;
	//PORT A SET OUTPUT MODE 
  * (volatile uint32_t *) (0x48000000) |= 1<<10;
  * (volatile uint32_t *) (0x48000000) &= ~(1<<11);

	while(1)
	{
 	//TOGGLE 5 BIT ON  
 	* (volatile uint32_t *) (0x48000018) |= 1<<5;
	spin(60000);
	* (volatile uint32_t *) (0x48000018) &= ~(1<<5);
	* (volatile uint32_t *) (0x48000018) |= 1<<21;
	spin(60000);
	}
  	return 0;
}
