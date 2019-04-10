SECTIONS
{
        /* interrupt vectors start at zero */
        . = 0x907000;  /* start of flash */

        .text :  {  *(.text)   }

        /* constant data follows code but still in flash */
        .data :
        {
          *(.data)
          *(.rom)
        }

}
