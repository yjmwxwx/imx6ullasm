	.syntax unified
	.arch armv7-a
	.align 2
	.text
_xiangliangbiao:
	ldr     pc, = reset 			@Reset_Handler      
	ldr     pc, = undefined			@Undefined_Handler     
	ldr     pc, = svc			@SVC_Handler           
	ldr     pc, = prefabort			@PrefAbort_Handler      
	ldr     pc, = dataabort			@DataAbort_Handler     
	.word   0                            
	ldr     pc, = irq			@IRQ_Handler           
	ldr     pc, = fiq			@FIQ_Handler
	.ltorg
reset:
_gpio5_4kai:	
	ldr r2, = 0x1fffff	@延时数
	ldr r0, = 0x20ac000	@GPIO5_DR基地址
	mov r1, # 0x10		@io4
	str r1, [r0, # 0x04]	@io4配置为输出
	str r1, [r0]		@io4开
_gpio5_4kaiyanshi:		@io4开延时
	subs r2, r2, # 1	@延时数减1
	bne _gpio5_4kaiyanshi	@没减到0就循环减
	ldr r2, = 0x1fffff	@延时数
_gpio5_4guan:			@io4关
	mov r1, # 0		@0关
	str r1, [r0]		@写入GPIO5_DR io关
_gpio5_4guanyanshi:		@io4关延时
	subs r2, r2, # 1	@延时数减1
	bne _gpio5_4guanyanshi	@没减到0就循环减
	b _gpio5_4kai		@跳回IO开
undefined:
svc:
prefabort:
dataabort:
irq:
fiq:
	b reset
	.end
