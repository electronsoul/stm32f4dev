.syntax unified

.word _sidata
.word _sdata
.word _edata
//.word _sbss
//.word _ebss
.word _estack

.section .text.reset
.weak reset
.type reset, %function

reset:
	ldr r0, =_estack
	mov sp, r0

	ldr r0, =_sdata
	ldr r1, =_edata
	ldr r2, =_sidata
	movs r3, #0
	b LoopCopyDataInit

	CopyDataInit:
	ldr r4, [r2, r3]
	str r4, [r0, r3]
	adds r3, r3, #4

	LoopCopyDataInit:
	adds r4, r0, r3
	cmp r4, r1
	bcc CopyDataInit

	bl main
	
	loopForever:
		b loopForever
	
.size reset, .-reset

.section .vectortable, "a", %progbits
.type vectors, %object
.size vectors, .-vectors

vectors:
	.word  _estack
	.word  reset
	.word  nmi_handler
	.word  hardfault_handler
	.word  0
	.word  0
	.word  0
	.word  0
	.word  0
	.word  0
	.word  0
	.word  svc_handler
	.word  0
	.word  0
	.word  pendsv_handler
	.word  systick_handler
	.word  wwdg_irqhandler                   /* window watchdog              */
	.word  pvd_vddio2_irqhandler             /* pvd and vddio2 through exti line detect */
	.word  rtc_irqhandler                    /* rtc through the exti line    */
	.word  flash_irqhandler                  /* flash                        */
	.word  rcc_crs_irqhandler                /* rcc and crs                  */
	.word  exti0_1_irqhandler                /* exti line 0 and 1            */
	.word  exti2_3_irqhandler                /* exti line 2 and 3            */
	.word  exti4_15_irqhandler               /* exti line 4 to 15            */
	.word  tsc_irqhandler                    /* tsc                          */
	.word  dma1_channel1_irqhandler          /* dma1 channel 1               */
	.word  dma1_channel2_3_irqhandler        /* dma1 channel 2 and channel 3 */
	.word  dma1_channel4_5_6_7_irqhandler    /* dma1 channel 4, channel 5, channel 6 and channel 7*/
	.word  adc1_comp_irqhandler              /* adc1, comp1 and comp2         */
	.word  tim1_brk_up_trg_com_irqhandler    /* tim1 break, update, trigger and commutation */
	.word  tim1_cc_irqhandler                /* tim1 capture compare         */
	.word  tim2_irqhandler                   /* tim2                         */
	.word  tim3_irqhandler                   /* tim3                         */
 	.word  tim6_dac_irqhandler               /* tim6 and dac                 */
	.word  tim7_irqhandler                   /* tim7                         */
	.word  tim14_irqhandler                  /* tim14                        */
	.word  tim15_irqhandler                  /* tim15                        */
	.word  tim16_irqhandler                  /* tim16                        */
	.word  tim17_irqhandler                  /* tim17                        */
	.word  i2c1_irqhandler                   /* i2c1                         */
	.word  i2c2_irqhandler                   /* i2c2                         */
	.word  spi1_irqhandler                   /* spi1                         */
 	.word  spi2_irqhandler                   /* spi2                         */
	.word  usart1_irqhandler                 /* usart1                       */
	.word  usart2_irqhandler                 /* usart2                       */
	.word  usart3_4_irqhandler               /* usart3 and usart4            */
	.word  cec_can_irqhandler                /* cec and can                  */
	.word  usb_irqhandler                    /* usb                          */

.weak  nmi_handler
.weak  hardfault_handler
.weak  svc_handler
.weak  pendsv_handler
.weak  systick_handler
.weak  wwdg_irqhandler                   /* window watchdog              */
.weak  pvd_vddio2_irqhandler             /* pvd and vddio2 through exti line detect */
.weak  rtc_irqhandler                    /* rtc through the exti line    */
.weak  flash_irqhandler                  /* flash                        */
.weak  rcc_crs_irqhandler                /* rcc and crs                  */
.weak  exti0_1_irqhandler                /* exti line 0 and 1            */
.weak  exti2_3_irqhandler                /* exti line 2 and 3            */
.weak  exti4_15_irqhandler               /* exti line 4 to 15            */
.weak  tsc_irqhandler                    /* tsc                          */
.weak  dma1_channel1_irqhandler          /* dma1 channel 1               */
.weak  dma1_channel2_3_irqhandler
.weak  dma1_channel1_irqhandler          /* dma1 channel 1               */
.weak  dma1_channel2_3_irqhandler        /* dma1 channel 2 and channel 3 */
.weak  dma1_channel4_5_6_7_irqhandler    /* dma1 channel 4, channel 5, channel 6 and channel 7*/
.weak  adc1_comp_irqhandler              /* adc1, comp1 and comp2         */
.weak  tim1_brk_up_trg_com_irqhandler    /* tim1 break, update, trigger and commutation */
.weak  tim1_cc_irqhandler                /* tim1 capture compare         */
.weak  tim2_irqhandler                   /* tim2                         */
.weak  tim3_irqhandler                   /* tim3                         */
.weak  tim6_dac_irqhandler               /* tim6 and dac                 */
.weak  tim7_irqhandler                   /* tim7                         */
.weak  tim14_irqhandler                  /* tim14                        */
.weak  tim15_irqhandler                  /* tim15                        */
.weak  tim16_irqhandler                  /* tim16                        */
.weak  tim17_irqhandler                  /* tim17                        */
.weak  i2c1_irqhandler                   /* i2c1                         */
.weak  i2c2_irqhandler                   /* i2c2                         */
.weak  spi1_irqhandler                   /* spi1                         */
.weak  spi2_irqhandler                   /* spi2                         */
.weak  usart1_irqhandler                 /* usart1                       */
.weak  usart2_irqhandler                 /* usart2                       */
.weak  usart3_4_irqhandler               /* usart3 and usart4            */
.weak  cec_can_irqhandler  
.weak  usb_irqhandler


