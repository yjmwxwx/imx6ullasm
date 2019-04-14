	@作者：yjmwxwx
	@时间：2019-04-14
	@功能：汉字翻译成机器码
	@cpu:imx6ull
	@运行地址：0x80000000
	@读取汉字所在地址：0x80000400
	@保存机器码地址：0x80000500
	.syntax unified
	.arch armv7-a
	.align 4
	.arm
	.data
__han_zi_ma_biao:
	.int 0x0a9188e6
__ji_qi_ma:
	.int 0xaa
__dan_xiang_lian_biao:
	.word __di_yi_ge
__di_yi_ge:
	.word __di_2_ge, __han_zi_ma_biao, __ji_qi_ma
__di_2_ge:
	.int 0xffffffff
__bao_cun_ji_qi_ma_zhi_zhen:
	.int 0x80000500
__han_zi_ma_zhi_zhen:
	.int 0x80000400
	
	.text
__han_zi_zhuan_ji_qi_ma:
__du_han_zi_ma_wen_jian:
	ldr r0, = __han_zi_ma_zhi_zhen
	ldr r1, [r0]
__cha_zhao_ji_qi_ma:
	ldr r3, = __dan_xiang_lian_biao
	ldr r3, [r3]
	add r3, r3, # 4
	ldr r2, [r3]
	bl __bi_jiao_han_zi_ma
	cmp r0, # 0
	it ne
	bne ting
	add r3, r3, # 4
	ldr r0, [r3]
	bl __bao_cun_ji_qi_ma
ting:
	b ting
	
__bi_jiao_han_zi_ma:
	push {r3,r4,lr}
__bi_jiao_han_zi_ma_xun_huan:	
	ldrb r3, [r1], # 1
	ldrb r4, [r2], # 1
	cmp r3, # 0x0a
	ite eq
	beq __han_zi_ma_xiang_tong
	cmpne r3, r4
	ite ne
	bne __han_zi_ma_bu_tong
	beq __bi_jiao_han_zi_ma_xun_huan
__han_zi_ma_xiang_tong:
	mov r0, # 0
	pop {r3,r4,pc}
__han_zi_ma_bu_tong:
	mov r0, # 1
	pop {r3,r4,pc}
__bao_cun_ji_qi_ma:
	ldr r0, [r0]
	ldr r2, = __bao_cun_ji_qi_ma_zhi_zhen
	ldr r1, [r2]
	strb r0, [r1], # 1
	str r1, [r2]
	bx lr
	.end
