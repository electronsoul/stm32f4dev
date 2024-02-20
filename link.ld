ENTRY(_reset)


MEMORY {
  flash(rx)  : ORIGIN = 0x08000000, LENGTH = 128k
  sram(rwx)  : ORIGIN = 0x20000000, LENGTH = 16k  
}

_estack     = ORIGIN(sram) + LENGTH(sram);    /* stack points to end of SRAM */

SECTIONS
{
	.vectortable :
	{
	. = ALIGN(4);
	KEEP(*(.vectortable))
	. = ALIGN(4);
	} > flash
	
	.text : 
	{	
		. = ALIGN(4);
	  	*(.text*)
		*(.rodata*)
		_etext = .;
		. = ALIGN(4);
	 }  > flash
	
	.bss (NOLOAD) : 
	{	
		. = ALIGN(4);
		_sbss = . ;              /* .bss section start */
		*(.bss .bss.*)
		*(COMMON)
		_ebss = . ;              /* .bss section end */
		. = ALIGN(4);
	} > sram

	_sidata = LOADADDR(.data);
	.data : 
	{	
		. = ALIGN(4);
		_sdata = .;   /* .data section start */
		*(.data*);
		_edata = .;  /* .data section end */
		. = ALIGN(4);
	} > sram AT > flash
	
}
