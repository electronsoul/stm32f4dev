//__attribute__((naked, noreturn))
/*void _reset(void) {
  __asm("ldr r0, = _estack");  // Set initial stack pointer
  __asm("mov sp,r0");

  extern uint32_t _sbss, _ebss, _sdata, _edata, _etext;

   /* uint32_t *init_values_ptr = &_etext;
    uint32_t *data_ptr = &_sdata;

    if (init_values_ptr != data_ptr) {
        for (; data_ptr < &_edata;) {
            *data_ptr++ = *init_values_ptr++;
        }
    }*/

    /* Clear the zero segment 
    for (uint32_t *bss_ptr = &_sbss; bss_ptr < &_ebss;) {
        *bss_ptr++ = 0;
    }

  // memset .bss to zero, and copy .data section to RAM region
  //extern long _sbss, _ebss, _sdata, _edata, _sidata;
  for (uint32_t *src = &_sbss; src < &_ebss; src++) *src = 0;
  for (uint32_t *src = &_etext, *dst = &_sdata; src < &_edata;) *src++ = *dst++;

  __asm("bl main");
  __asm("loopforever:");
  __asm("b loopforever");
}

// 16 standard and 32 STM32-specific handlers
__attribute__((section(".vectors"))) void (*tab[16 + 32])(void) = {
  0, _reset
};
*/

