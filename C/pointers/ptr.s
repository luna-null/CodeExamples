
ptr:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <printf@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	f3 0f 1e fa          	endbr64
    1044:	31 ed                	xor    %ebp,%ebp
    1046:	49 89 d1             	mov    %rdx,%r9
    1049:	5e                   	pop    %rsi
    104a:	48 89 e2             	mov    %rsp,%rdx
    104d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1051:	50                   	push   %rax
    1052:	54                   	push   %rsp
    1053:	45 31 c0             	xor    %r8d,%r8d
    1056:	31 c9                	xor    %ecx,%ecx
    1058:	48 8d 3d e1 00 00 00 	lea    0xe1(%rip),%rdi        # 1140 <main>
    105f:	ff 15 5b 2f 00 00    	call   *0x2f5b(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1065:	f4                   	hlt
    1066:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    106d:	00 00 00 
    1070:	48 8d 3d a1 2f 00 00 	lea    0x2fa1(%rip),%rdi        # 4018 <__TMC_END__>
    1077:	48 8d 05 9a 2f 00 00 	lea    0x2f9a(%rip),%rax        # 4018 <__TMC_END__>
    107e:	48 39 f8             	cmp    %rdi,%rax
    1081:	74 15                	je     1098 <_start+0x58>
    1083:	48 8b 05 3e 2f 00 00 	mov    0x2f3e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    108a:	48 85 c0             	test   %rax,%rax
    108d:	74 09                	je     1098 <_start+0x58>
    108f:	ff e0                	jmp    *%rax
    1091:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1098:	c3                   	ret
    1099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10a0:	48 8d 3d 71 2f 00 00 	lea    0x2f71(%rip),%rdi        # 4018 <__TMC_END__>
    10a7:	48 8d 35 6a 2f 00 00 	lea    0x2f6a(%rip),%rsi        # 4018 <__TMC_END__>
    10ae:	48 29 fe             	sub    %rdi,%rsi
    10b1:	48 89 f0             	mov    %rsi,%rax
    10b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10b8:	48 c1 f8 03          	sar    $0x3,%rax
    10bc:	48 01 c6             	add    %rax,%rsi
    10bf:	48 d1 fe             	sar    $1,%rsi
    10c2:	74 14                	je     10d8 <_start+0x98>
    10c4:	48 8b 05 0d 2f 00 00 	mov    0x2f0d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10cb:	48 85 c0             	test   %rax,%rax
    10ce:	74 08                	je     10d8 <_start+0x98>
    10d0:	ff e0                	jmp    *%rax
    10d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	80 3d 2d 2f 00 00 00 	cmpb   $0x0,0x2f2d(%rip)        # 4018 <__TMC_END__>
    10eb:	75 33                	jne    1120 <_start+0xe0>
    10ed:	55                   	push   %rbp
    10ee:	48 83 3d ea 2e 00 00 	cmpq   $0x0,0x2eea(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    10f5:	00 
    10f6:	48 89 e5             	mov    %rsp,%rbp
    10f9:	74 0d                	je     1108 <_start+0xc8>
    10fb:	48 8b 3d 0e 2f 00 00 	mov    0x2f0e(%rip),%rdi        # 4010 <__dso_handle>
    1102:	ff 15 d8 2e 00 00    	call   *0x2ed8(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1108:	e8 63 ff ff ff       	call   1070 <_start+0x30>
    110d:	c6 05 04 2f 00 00 01 	movb   $0x1,0x2f04(%rip)        # 4018 <__TMC_END__>
    1114:	5d                   	pop    %rbp
    1115:	c3                   	ret
    1116:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    111d:	00 00 00 
    1120:	c3                   	ret
    1121:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1128:	00 00 00 00 
    112c:	0f 1f 40 00          	nopl   0x0(%rax)
    1130:	f3 0f 1e fa          	endbr64
    1134:	e9 67 ff ff ff       	jmp    10a0 <_start+0x60>
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <main>:
    1140:	55                   	push   %rbp
    1141:	48 89 e5             	mov    %rsp,%rbp
    1144:	48 83 ec 20          	sub    $0x20,%rsp
    1148:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    114f:	89 7d f8             	mov    %edi,-0x8(%rbp)
    1152:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1156:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    115d:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1160:	3b 45 f8             	cmp    -0x8(%rbp),%eax
    1163:	0f 8d 28 00 00 00    	jge    1191 <main+0x51>
    1169:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    116d:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
    1171:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
    1175:	48 8d 3d 88 0e 00 00 	lea    0xe88(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    117c:	b0 00                	mov    $0x0,%al
    117e:	e8 ad fe ff ff       	call   1030 <printf@plt>
    1183:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1186:	83 c0 01             	add    $0x1,%eax
    1189:	89 45 ec             	mov    %eax,-0x14(%rbp)
    118c:	e9 cc ff ff ff       	jmp    115d <main+0x1d>
    1191:	31 c0                	xor    %eax,%eax
    1193:	48 83 c4 20          	add    $0x20,%rsp
    1197:	5d                   	pop    %rbp
    1198:	c3                   	ret

Disassembly of section .fini:

000000000000119c <_fini>:
    119c:	f3 0f 1e fa          	endbr64
    11a0:	48 83 ec 08          	sub    $0x8,%rsp
    11a4:	48 83 c4 08          	add    $0x8,%rsp
    11a8:	c3                   	ret
