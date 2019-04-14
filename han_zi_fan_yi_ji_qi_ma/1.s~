	@作者：yjmwxwx
	@时间：2019
	.syntax unified
	.arch armv7-a
	.align 4
	.arm
	.text
	movw r6, # 0x4000
	movt r6, # 0x8000		@ r6 = 0x80004000
	mov r0, r6			@ r0 读 r6
	mov r4, # 1000			@ 10K内存 
	mov r5, # 0			@ 10K内存写0
_nei_cun_qing_ling:			@ 循环写0函数
	str r5, [r6], # 0x04		@ R5= 0 写到R6的地址然后地址加4
	subs r4, r4, # 1		@ 执行一次计数减1
	bne _nei_cun_qing_ling		@ 不等与0循环
	movw r1, # 0x4811 	
	movt r1, # 0x8000		@ r1 = 0x80004811 第一级描述符
	add r0, r0, # 0x400		@ 0x80004000 加 0x400 = 0x80004400
	str r1, [r0]			@ 第一级描述符写到0x80004400
	movw r1, # 0xc453
	movt r1, # 0x020a		@ r1 = 0x20ac453 第二级描述符
	add r0, r0, # 0x400		@ 0x80004400 加 0x400 = 0x80004800
	str r1, [r0]			@ 第二级描述符写到0x80004800
	movw r0, # 0x406a
	movt r0, # 0x8000		@ r0= 0x8000406a
	mcr p15, 0, r0, c2, c0, 0	@ r0写到TTBR0
	mcr p15, 0, r0, c2, c0, 1       @ r0写到TTBR1
	movw r0, # 0x3C7D		
	movt r0, # 0x10C5		@ r0 = 0x10c53c7d
	mcr p15, 0, r0, c1, c0, 0	@ 打开MMU
	movw r0, # 0x0000
	movt r0, # 0x1000		@ GPIO5_DR虚拟地址= 0x10000000
_led_kai_guan:				@ LED闪烁程序
	mov r1, # 0x10			@ IO4
	str r1, [r0, # 0x04]		@ IO4配置为输出
	str r1, [r0]			@ IO4开
	mov r3, # 0x00			@ 
	movw r2, # 0xffff
	movt r2, # 0x03ff		@ R2 = 延时数0x3ffffff
_led_xun_huan1:				@ IO开延时
	subs r2, r2, # 1		@ R2减1
	bne _led_xun_huan1		@ 开延时循环
	str r3, [r0]			@ 延时结束关闭IO4
	movw r2, # 0xffff
	movt r2, # 0x03ff		@ 延时数重新写入R2
_led_xun_huan2:				@ IO关延时
	subs r2, r2, # 1		@ R2减1
	bne _led_xun_huan2		@ 关延时循环
	b _led_kai_guan			@ 跳转到LED函数
