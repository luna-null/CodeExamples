
helloWorld:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bc8 <_init>:
  400bc8:	f3 0f 1e fa          	endbr64
  400bcc:	48 83 ec 08          	sub    rsp,0x8
  400bd0:	48 8b 05 a1 23 00 00 	mov    rax,QWORD PTR [rip+0x23a1]        # 402f78 <__gmon_start__>
  400bd7:	48 85 c0             	test   rax,rax
  400bda:	74 02                	je     400bde <_init+0x16>
  400bdc:	ff d0                	call   rax
  400bde:	48 83 c4 08          	add    rsp,0x8
  400be2:	c3                   	ret

Disassembly of section .plt:

0000000000400bf0 <newCAF@plt-0x10>:
  400bf0:	ff 35 fa 23 00 00    	push   QWORD PTR [rip+0x23fa]        # 402ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bf6:	ff 25 fc 23 00 00    	jmp    QWORD PTR [rip+0x23fc]        # 402ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bfc:	90                   	nop
  400bfd:	90                   	nop
  400bfe:	90                   	nop
  400bff:	90                   	nop

0000000000400c00 <newCAF@plt>:
  400c00:	ff 25 fa 23 00 00    	jmp    QWORD PTR [rip+0x23fa]        # 403000 <newCAF>
  400c06:	68 00 00 00 00       	push   0x0
  400c0b:	e9 e0 ff ff ff       	jmp    400bf0 <_init+0x28>

0000000000400c10 <hs_main@plt>:
  400c10:	ff 25 f2 23 00 00    	jmp    QWORD PTR [rip+0x23f2]        # 403008 <hs_main>
  400c16:	68 01 00 00 00       	push   0x1
  400c1b:	e9 d0 ff ff ff       	jmp    400bf0 <_init+0x28>

Disassembly of section .text:

0000000000400c20 <_start>:
  400c20:	f3 0f 1e fa          	endbr64
  400c24:	31 ed                	xor    ebp,ebp
  400c26:	49 89 d1             	mov    r9,rdx
  400c29:	5e                   	pop    rsi
  400c2a:	48 89 e2             	mov    rdx,rsp
  400c2d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  400c31:	50                   	push   rax
  400c32:	54                   	push   rsp
  400c33:	45 31 c0             	xor    r8d,r8d
  400c36:	31 c9                	xor    ecx,ecx
  400c38:	48 8d 3d 4c 02 00 00 	lea    rdi,[rip+0x24c]        # 400e8b <main>
  400c3f:	ff 15 2b 23 00 00    	call   QWORD PTR [rip+0x232b]        # 402f70 <__libc_start_main@GLIBC_2.34>
  400c45:	f4                   	hlt
  400c46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400c4d:	00 00 00 

0000000000400c50 <_dl_relocate_static_pie>:
  400c50:	f3 0f 1e fa          	endbr64
  400c54:	c3                   	ret
  400c55:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  400c5c:	00 00 00 00 
  400c60:	b8 10 30 40 00       	mov    eax,0x403010
  400c65:	48 3d 10 30 40 00    	cmp    rax,0x403010
  400c6b:	74 13                	je     400c80 <_dl_relocate_static_pie+0x30>
  400c6d:	48 8b 05 0c 23 00 00 	mov    rax,QWORD PTR [rip+0x230c]        # 402f80 <_ITM_deregisterTMCloneTable>
  400c74:	48 85 c0             	test   rax,rax
  400c77:	74 07                	je     400c80 <_dl_relocate_static_pie+0x30>
  400c79:	bf 10 30 40 00       	mov    edi,0x403010
  400c7e:	ff e0                	jmp    rax
  400c80:	c3                   	ret
  400c81:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  400c88:	00 00 00 00 
  400c8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400c90:	be 10 30 40 00       	mov    esi,0x403010
  400c95:	48 81 ee 10 30 40 00 	sub    rsi,0x403010
  400c9c:	48 89 f0             	mov    rax,rsi
  400c9f:	48 c1 ee 3f          	shr    rsi,0x3f
  400ca3:	48 c1 f8 03          	sar    rax,0x3
  400ca7:	48 01 c6             	add    rsi,rax
  400caa:	48 d1 fe             	sar    rsi,1
  400cad:	74 19                	je     400cc8 <_dl_relocate_static_pie+0x78>
  400caf:	48 8b 05 d2 22 00 00 	mov    rax,QWORD PTR [rip+0x22d2]        # 402f88 <_ITM_registerTMCloneTable>
  400cb6:	48 85 c0             	test   rax,rax
  400cb9:	74 0d                	je     400cc8 <_dl_relocate_static_pie+0x78>
  400cbb:	bf 10 30 40 00       	mov    edi,0x403010
  400cc0:	ff e0                	jmp    rax
  400cc2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400cc8:	c3                   	ret
  400cc9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400cd0:	f3 0f 1e fa          	endbr64
  400cd4:	80 3d 35 24 00 00 00 	cmp    BYTE PTR [rip+0x2435],0x0        # 403110 <__bss_start>
  400cdb:	75 13                	jne    400cf0 <_dl_relocate_static_pie+0xa0>
  400cdd:	55                   	push   rbp
  400cde:	48 89 e5             	mov    rbp,rsp
  400ce1:	e8 7a ff ff ff       	call   400c60 <_dl_relocate_static_pie+0x10>
  400ce6:	c6 05 23 24 00 00 01 	mov    BYTE PTR [rip+0x2423],0x1        # 403110 <__bss_start>
  400ced:	5d                   	pop    rbp
  400cee:	c3                   	ret
  400cef:	90                   	nop
  400cf0:	c3                   	ret
  400cf1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  400cf8:	00 00 00 00 
  400cfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400d00:	f3 0f 1e fa          	endbr64
  400d04:	eb 8a                	jmp    400c90 <_dl_relocate_static_pie+0x40>
  400d06:	66 90                	xchg   ax,ax
	...
  400d10:	0f 00 00             	sldt   WORD PTR [rax]
  400d13:	00 50 23             	add    BYTE PTR [rax+0x23],dl
  400d16:	00 00                	add    BYTE PTR [rax],al
  400d18:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  400d1c:	4c 39 f8             	cmp    rax,r15
  400d1f:	72 27                	jb     400d48 <_dl_relocate_static_pie+0xf8>
  400d21:	48 8b 05 68 22 00 00 	mov    rax,QWORD PTR [rip+0x2268]        # 402f90 <stg_upd_frame_info>
  400d28:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  400d2c:	48 89 5d f8          	mov    QWORD PTR [rbp-0x8],rbx
  400d30:	4c 8d 35 ac 02 00 00 	lea    r14,[rip+0x2ac]        # 400fe3 <cIQ_str>
  400d37:	48 8b 1d 5a 22 00 00 	mov    rbx,QWORD PTR [rip+0x225a]        # 402f98 <ghczmprim_GHCziCString_unpackCStringzh_closure>
  400d3e:	48 83 c5 f0          	add    rbp,0xfffffffffffffff0
  400d42:	ff 25 58 22 00 00    	jmp    QWORD PTR [rip+0x2258]        # 402fa0 <stg_ap_n_fast>
  400d48:	41 ff 65 f0          	jmp    QWORD PTR [r13-0x10]
  400d4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	...
  400d58:	15 00 00 00 20       	adc    eax,0x20000000
  400d5d:	23 00                	and    eax,DWORD PTR [rax]
	...

0000000000400d60 <Main_main_info>:
  400d60:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  400d64:	4c 39 f8             	cmp    rax,r15
  400d67:	0f 82 b1 00 00 00    	jb     400e1e <Main_main_info+0xbe>
  400d6d:	49 83 c4 10          	add    r12,0x10
  400d71:	4d 3b a5 58 03 00 00 	cmp    r12,QWORD PTR [r13+0x358]
  400d78:	0f 87 95 00 00 00    	ja     400e13 <Main_main_info+0xb3>
  400d7e:	48 83 ec 08          	sub    rsp,0x8
  400d82:	4c 89 e8             	mov    rax,r13
  400d85:	48 89 de             	mov    rsi,rbx
  400d88:	48 89 c7             	mov    rdi,rax
  400d8b:	31 c0                	xor    eax,eax
  400d8d:	e8 6e fe ff ff       	call   400c00 <newCAF@plt>
  400d92:	48 83 c4 08          	add    rsp,0x8
  400d96:	48 85 c0             	test   rax,rax
  400d99:	74 47                	je     400de2 <Main_main_info+0x82>
  400d9b:	48 8b 1d 06 22 00 00 	mov    rbx,QWORD PTR [rip+0x2206]        # 402fa8 <stg_bh_upd_frame_info>
  400da2:	48 89 5d f0          	mov    QWORD PTR [rbp-0x10],rbx
  400da6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400daa:	48 8d 05 67 ff ff ff 	lea    rax,[rip+0xffffffffffffff67]        # 400d18 <_dl_relocate_static_pie+0xc8>
  400db1:	49 89 44 24 f8       	mov    QWORD PTR [r12-0x8],rax
  400db6:	49 8d 44 24 f8       	lea    rax,[r12-0x8]
  400dbb:	48 8d 1d 36 00 00 00 	lea    rbx,[rip+0x36]        # 400df8 <Main_main_info+0x98>
  400dc2:	48 89 5d e0          	mov    QWORD PTR [rbp-0x20],rbx
  400dc6:	4c 8b 35 e3 21 00 00 	mov    r14,QWORD PTR [rip+0x21e3]        # 402fb0 <base_GHCziShow_zdfShowChar_closure>
  400dcd:	48 8b 1d e4 21 00 00 	mov    rbx,QWORD PTR [rip+0x21e4]        # 402fb8 <base_GHCziShow_zdfShowZMZN_closure>
  400dd4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  400dd8:	48 83 c5 e0          	add    rbp,0xffffffffffffffe0
  400ddc:	ff 25 de 21 00 00    	jmp    QWORD PTR [rip+0x21de]        # 402fc0 <stg_ap_p_fast>
  400de2:	ff 23                	jmp    QWORD PTR [rbx]
  400de4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400de8:	01 00                	add    DWORD PTR [rax],eax
  400dea:	00 00                	add    BYTE PTR [rax],al
  400dec:	00 00                	add    BYTE PTR [rax],al
  400dee:	00 00                	add    BYTE PTR [rax],al
  400df0:	1e                   	(bad)
  400df1:	00 00                	add    BYTE PTR [rax],al
  400df3:	00 58 22             	add    BYTE PTR [rax+0x22],bl
  400df6:	00 00                	add    BYTE PTR [rax],al
  400df8:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
  400dfc:	48 89 c6             	mov    rsi,rax
  400dff:	49 89 de             	mov    r14,rbx
  400e02:	48 8b 1d bf 21 00 00 	mov    rbx,QWORD PTR [rip+0x21bf]        # 402fc8 <base_SystemziIO_print_closure>
  400e09:	48 83 c5 10          	add    rbp,0x10
  400e0d:	ff 25 bd 21 00 00    	jmp    QWORD PTR [rip+0x21bd]        # 402fd0 <stg_ap_pp_fast>
  400e13:	49 c7 85 88 03 00 00 	mov    QWORD PTR [r13+0x388],0x10
  400e1a:	10 00 00 00 
  400e1e:	41 ff 65 f0          	jmp    QWORD PTR [r13-0x10]
  400e22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
	...
  400e30:	15 00 00 00 98       	adc    eax,0x98000000
  400e35:	22 00                	and    al,BYTE PTR [rax]
	...

0000000000400e38 <ZCMain_main_info>:
  400e38:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  400e3c:	4c 39 f8             	cmp    rax,r15
  400e3f:	72 46                	jb     400e87 <ZCMain_main_info+0x4f>
  400e41:	48 83 ec 08          	sub    rsp,0x8
  400e45:	4c 89 e8             	mov    rax,r13
  400e48:	48 89 de             	mov    rsi,rbx
  400e4b:	48 89 c7             	mov    rdi,rax
  400e4e:	31 c0                	xor    eax,eax
  400e50:	e8 ab fd ff ff       	call   400c00 <newCAF@plt>
  400e55:	48 83 c4 08          	add    rsp,0x8
  400e59:	48 85 c0             	test   rax,rax
  400e5c:	74 27                	je     400e85 <ZCMain_main_info+0x4d>
  400e5e:	48 8b 1d 43 21 00 00 	mov    rbx,QWORD PTR [rip+0x2143]        # 402fa8 <stg_bh_upd_frame_info>
  400e65:	48 89 5d f0          	mov    QWORD PTR [rbp-0x10],rbx
  400e69:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400e6d:	4c 8d 35 3c 22 00 00 	lea    r14,[rip+0x223c]        # 4030b0 <Main_main_closure>
  400e74:	48 8b 1d 5d 21 00 00 	mov    rbx,QWORD PTR [rip+0x215d]        # 402fd8 <base_GHCziTopHandler_runMainIO_closure>
  400e7b:	48 83 c5 f0          	add    rbp,0xfffffffffffffff0
  400e7f:	ff 25 3b 21 00 00    	jmp    QWORD PTR [rip+0x213b]        # 402fc0 <stg_ap_p_fast>
  400e85:	ff 23                	jmp    QWORD PTR [rbx]
  400e87:	41 ff 65 f0          	jmp    QWORD PTR [r13-0x10]

0000000000400e8b <main>:
  400e8b:	55                   	push   rbp
  400e8c:	48 89 e5             	mov    rbp,rsp
  400e8f:	53                   	push   rbx
  400e90:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  400e97:	89 bd 7c ff ff ff    	mov    DWORD PTR [rbp-0x84],edi
  400e9d:	48 89 b5 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rsi
  400ea4:	48 8b 05 35 21 00 00 	mov    rax,QWORD PTR [rip+0x2135]        # 402fe0 <defaultRtsConfig>
  400eab:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  400eae:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  400eb2:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
  400eb6:	48 89 5d 88          	mov    QWORD PTR [rbp-0x78],rbx
  400eba:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  400ebe:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  400ec2:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  400ec6:	48 89 5d 98          	mov    QWORD PTR [rbp-0x68],rbx
  400eca:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  400ece:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  400ed2:	48 89 4d a0          	mov    QWORD PTR [rbp-0x60],rcx
  400ed6:	48 89 5d a8          	mov    QWORD PTR [rbp-0x58],rbx
  400eda:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  400ede:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  400ee2:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
  400ee6:	48 89 5d b8          	mov    QWORD PTR [rbp-0x48],rbx
  400eea:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  400eee:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  400ef2:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
  400ef6:	48 89 5d c8          	mov    QWORD PTR [rbp-0x38],rbx
  400efa:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  400efe:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  400f02:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  400f06:	48 89 5d d8          	mov    QWORD PTR [rbp-0x28],rbx
  400f0a:	48 8b 50 68          	mov    rdx,QWORD PTR [rax+0x68]
  400f0e:	48 8b 40 60          	mov    rax,QWORD PTR [rax+0x60]
  400f12:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  400f16:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  400f1a:	c7 45 80 03 00 00 00 	mov    DWORD PTR [rbp-0x80],0x3
  400f21:	48 c7 45 88 01 00 00 	mov    QWORD PTR [rbp-0x78],0x1
  400f28:	00 
  400f29:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  400f30:	00 
  400f31:	48 c7 45 98 01 00 00 	mov    QWORD PTR [rbp-0x68],0x1
  400f38:	00 
  400f39:	48 8b b5 70 ff ff ff 	mov    rsi,QWORD PTR [rbp-0x90]
  400f40:	8b bd 7c ff ff ff    	mov    edi,DWORD PTR [rbp-0x84]
  400f46:	48 83 ec 70          	sub    rsp,0x70
  400f4a:	48 89 e0             	mov    rax,rsp
  400f4d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  400f51:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  400f55:	48 89 08             	mov    QWORD PTR [rax],rcx
  400f58:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  400f5c:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  400f60:	48 8b 5d 98          	mov    rbx,QWORD PTR [rbp-0x68]
  400f64:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  400f68:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  400f6c:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
  400f70:	48 8b 5d a8          	mov    rbx,QWORD PTR [rbp-0x58]
  400f74:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  400f78:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  400f7c:	48 8b 4d b0          	mov    rcx,QWORD PTR [rbp-0x50]
  400f80:	48 8b 5d b8          	mov    rbx,QWORD PTR [rbp-0x48]
  400f84:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  400f88:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  400f8c:	48 8b 4d c0          	mov    rcx,QWORD PTR [rbp-0x40]
  400f90:	48 8b 5d c8          	mov    rbx,QWORD PTR [rbp-0x38]
  400f94:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  400f98:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  400f9c:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  400fa0:	48 8b 5d d8          	mov    rbx,QWORD PTR [rbp-0x28]
  400fa4:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  400fa8:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
  400fac:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  400fb0:	48 8b 5d e8          	mov    rbx,QWORD PTR [rbp-0x18]
  400fb4:	48 89 48 60          	mov    QWORD PTR [rax+0x60],rcx
  400fb8:	48 89 58 68          	mov    QWORD PTR [rax+0x68],rbx
  400fbc:	48 8d 05 2d 21 00 00 	lea    rax,[rip+0x212d]        # 4030f0 <ZCMain_main_closure>
  400fc3:	48 89 c2             	mov    rdx,rax
  400fc6:	e8 45 fc ff ff       	call   400c10 <hs_main@plt>

Disassembly of section .fini:

0000000000400fcc <_fini>:
  400fcc:	f3 0f 1e fa          	endbr64
  400fd0:	48 83 ec 08          	sub    rsp,0x8
  400fd4:	48 83 c4 08          	add    rsp,0x8
  400fd8:	c3                   	ret
