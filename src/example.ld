SECTIONS
{
    . = 0 + SIZEOF_HEADERS;
    .hash           : { *(.hash) }
    .gnu.hash       : { *(.gnu.hash) }
    .dynsym         : { *(.dynsym) }
    .dynstr         : { *(.dynstr) }
    .version        : { *(.version) }
    .version_d      : { *(.version_d) }
    .version_r      : { *(.version_r) }
    .rel.dyn        : { *(.rel.dyn) }
    .rel.plt        : { *(.rel.plt) }
    .init           : { KEEP (*(.init)) }
    .plt            : { *(.plt) }
    .text           : { *(.text .text.*) }
    .fini           : { KEEP (*(.fini)) }
    .rodata         : { *(.rodata .rodata.*) }
    .ARM.extab   : { *(.ARM.extab*) }
    __exidx_start = .;
    .ARM.exidx   : { *(.ARM.exidx*) }
    __exidx_end = .;
    .interp : { *(.interp) }

    . = ALIGN (CONSTANT (MAXPAGESIZE)) - ((CONSTANT (MAXPAGESIZE) - .) &amp; (CONSTANT (MAXPAGESIZE) - 1));
    . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE)); 
   
    .tdata    : { *(.tdata .tdata.*) }
    .tbss       : { *(.tbss .tbss.*) }
    .preinit_array     :
    {
                PROVIDE_HIDDEN (__preinit_array_start = .); 
                KEEP (*(.preinit_array))
                PROVIDE_HIDDEN (__preinit_array_end = .); 
    }
    .init_array     :
    {
                PROVIDE_HIDDEN (__init_array_start = .); 
                KEEP (*(SORT(.init_array.*)))
                KEEP (*(.init_array))
                PROVIDE_HIDDEN (__init_array_end = .); 
    }
    .fini_array     :
    {
                PROVIDE_HIDDEN (__fini_array_start = .); 
                KEEP (*(.fini_array))
                KEEP (*(SORT(.fini_array.*)))
                PROVIDE_HIDDEN (__fini_array_end = .); 
    }
    .dynamic        : { *(.dynamic) }
    .got            : { *(.got.plt) *(.got) }
    .data           :
    {
        *(.data .data.*)
    }
    .bss            :
    {
    *(.bss .bss.*)
        . = ALIGN(. != 0 ? 32 / 8 : 1);
    }
}
