void sha1_short1( __global uint4 *dst,const uint4 input,const uint size, const uint4 chbase1, __global uint *found_ind, __global uint *bitmaps, __global uint *found, uint i, const uint4 singlehash, uint factor) 
{  

uint4 SIZE; 
uint4 w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w16; 

uint ib,ic,id,ie;
uint4 A,B,C,D,E,K,l,tmp1,tmp2; 
uint b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
uint4 m=(uint4)0x00FF00FF;  
uint4 m2=(uint4)0xFF00FF00; 

uint4 K0 = (uint4)0x5A827999;
uint4 K1 = (uint4)0x6ED9EBA1;
uint4 K2 = (uint4)0x8F1BBCDC;
uint4 K3 = (uint4)0xCA62C1D6;

uint4 H0 = (uint4)0x67452301;
uint4 H1 = (uint4)0xEFCDAB89;
uint4 H2 = (uint4)0x98BADCFE;
uint4 H3 = (uint4)0x10325476;
uint4 H4 = (uint4)0xC3D2E1F0;

#define S1 1
#define S2 5
#define S3 30  
#define Sl 8
#define Sr 24  


ic = size+4;
id = ic*8; 
SIZE = (uint4)id; 

w0 = (uint4)input.x; 
w1 = (uint4)input.y; 
w2 = (uint4)input.z; 
w3 = (uint4)input.w; 

ib = (uint)i&255;  
ic = (uint)((i>>8)&255);
id = (uint)((i>>16)&255);  
ie = (uint)((i>>24)&255);  

if (size==1) {w0=chbase1|(ib<<8)|(ic<<16)|(id<<24);w1=ie|(0x80<<8);}
else if (size==2) {w0|=(chbase1<<8)|(ib<<16)|(ic<<24);w1=(id)|(ie<<8)|(0x80<<16);}  
else if (size==3) {w0|=(chbase1<<16)|(ib<<24);w1=ic|(id<<8)|(ie<<16)|(0x80<<24);}
else if (size==4) {w0|=(chbase1<<24);w1=(ib)|(ic<<8)|(id<<16)|(ie<<24);w2=(0x80);}  
else if (size==5) {w1=chbase1|(ib<<8)|(ic<<16)|(id<<24);w2=(ie)|(0x80<<8);} 
else if (size==6) {w1|=(chbase1<<8)|(ib<<16)|(ic<<24);w2=(id)|(ie<<8)|(0x80<<16);}  
else if (size==7) {w1|=(chbase1<<16)|(ib<<24);w2=(ic)|(id<<8)|(ie<<16)|(0x80<<24);} 
else if (size==8) {w1|=(chbase1<<24);w2=(ib)|(ic<<8)|(id<<16)|(ie<<24);w3=(0x80);}  
else if (size==9) {w2=(chbase1)|(ib<<8)|(ic<<16)|(id<<24);w3=(ie)|(0x80<<8);}
else if (size==10) {w2|=(chbase1<<8)|(ib<<16)|(ic<<24);w3=(id)|(ie<<8)|(0x80<<16);} 
else if (size==11) {w2|=(chbase1<<16)|(ib<<24);w3=(ic)|(id<<8)|(ie<<16)|(0x80<<24);}


w4=(uint4)0;
w5=(uint4)0;
w6=(uint4)0;
w7=(uint4)0;
w8=(uint4)0;
w9=(uint4)0;
w10=(uint4)0;  
w11=(uint4)0;  
w12=(uint4)0;  
w13=(uint4)0;  
w14=(uint4)0;  
w16=(uint4)0;  



A=H0;  
B=H1;  
C=H2;  
D=H3;  
E=H4;  


#define F_00_19(b,c,d)  ((((c) ^ (d)) & (b)) ^ (d))
#define F_20_39(b,c,d)  ((b) ^ (c) ^ (d))  
#define F_40_59(b,c,d)  (((b) & (c)) | (((b)|(c)) & (d)))  
#define F_60_79(b,c,d)  F_20_39(b,c,d) 



#define Endian_Reverse32(aa) { l=(aa);tmp1=rotate(l,Sl);tmp2=rotate(l,Sr); (aa)=bitselect(tmp2,tmp1,m); }
#define ROTATE1(a, b, c, d, e, x) e = e + rotate(a,S2); e = e + F_00_19(b,c,d); e = e + x; e = e + K; b = rotate(b,S3) 
#define ROTATE1_NULL(a, b, c, d, e)  e = e + rotate(a,S2);e = e+ F_00_19(b,c,d); e = e + K; b = rotate(b,S3)
#define ROTATE2_F(a, b, c, d, e, x) e = e + rotate(a,S2); e = e + F_20_39(b,c,d); e = e + x; e = e + K; b = rotate(b,S3) 
#define ROTATE3_F(a, b, c, d, e, x) e = e + rotate(a,S2); e = e + F_40_59(b,c,d); e = e + x; e = e + K; b = rotate(b,S3)
#define ROTATE4_F(a, b, c, d, e, x) e = e + rotate(a,S2); e = e + F_60_79(b,c,d); e = e + x; e = e + K; b = rotate(b,S3)


K = K0;
Endian_Reverse32(w0);  
ROTATE1(A, B, C, D, E, w0);
Endian_Reverse32(w1);  
ROTATE1(E, A, B, C, D, w1);
Endian_Reverse32(w2);  
ROTATE1(D, E, A, B, C, w2);
Endian_Reverse32(w3);  
ROTATE1(C, D, E, A, B, w3);

ROTATE1_NULL(B, C, D, E, A);
ROTATE1_NULL(A, B, C, D, E);
ROTATE1_NULL(E, A, B, C, D);
ROTATE1_NULL(D, E, A, B, C);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);
ROTATE1_NULL(A, B, C, D, E);
ROTATE1_NULL(E, A, B, C, D);
ROTATE1_NULL(D, E, A, B, C);
ROTATE1_NULL(C, D, E, A, B);
ROTATE1_NULL(B, C, D, E, A);

ROTATE1(A, B, C, D, E, SIZE);  

w16 = rotate((w13 ^ w8 ^ w2 ^ w0),S1);ROTATE1(E,A,B,C,D,w16);
w0 = rotate((w14 ^ w9 ^ w3 ^ w1),S1);ROTATE1(D,E,A,B,C,w0); 
w1 = rotate((SIZE ^ w10 ^ w4 ^ w2),S1); ROTATE1(C,D,E,A,B,w1); 
w2 = rotate((w16 ^ w11 ^ w5 ^ w3),S1);  ROTATE1(B,C,D,E,A,w2); 


K = K1;
w3 = rotate((w0 ^ w12 ^ w6 ^ w4),S1); ROTATE2_F(A, B, C, D, E, w3);
w4 = rotate((w1 ^ w13 ^ w7 ^ w5),S1); ROTATE2_F(E, A, B, C, D, w4);
w5 = rotate((w2 ^ w14 ^ w8 ^ w6),S1); ROTATE2_F(D, E, A, B, C, w5);
w6 = rotate((w3 ^ SIZE ^ w9 ^ w7),S1);ROTATE2_F(C, D, E, A, B, w6);
w7 = rotate((w4 ^ w16 ^ w10 ^ w8),S1); ROTATE2_F(B, C, D, E, A, w7);
w8 = rotate((w5 ^ w0 ^ w11 ^ w9),S1); ROTATE2_F(A, B, C, D, E, w8);
w9 = rotate((w6 ^ w1 ^ w12 ^ w10),S1); ROTATE2_F(E, A, B, C, D, w9);
w10 = rotate((w7 ^ w2 ^ w13 ^ w11),S1); ROTATE2_F(D, E, A, B, C, w10); 
w11 = rotate((w8 ^ w3 ^ w14 ^ w12),S1); ROTATE2_F(C, D, E, A, B, w11); 
w12 = rotate((w9 ^ w4 ^ SIZE ^ w13),S1); ROTATE2_F(B, C, D, E, A, w12);
w13 = rotate((w10 ^ w5 ^ w16 ^ w14),S1); ROTATE2_F(A, B, C, D, E, w13);
w14 = rotate((w11 ^ w6 ^ w0 ^ SIZE),S1); ROTATE2_F(E, A, B, C, D, w14);
SIZE = rotate((w12 ^ w7 ^ w1 ^ w16),S1); ROTATE2_F(D, E, A, B, C, SIZE);
w16 = rotate((w13 ^ w8 ^ w2 ^ w0),S1); ROTATE2_F(C, D, E, A, B, w16);  
w0 = rotate(w14 ^ w9 ^ w3 ^ w1,S1); ROTATE2_F(B, C, D, E, A, w0);  
w1 = rotate(SIZE ^ w10 ^ w4 ^ w2,S1); ROTATE2_F(A, B, C, D, E, w1);
w2 = rotate(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE2_F(E, A, B, C, D, w2); 
w3 = rotate(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE2_F(D, E, A, B, C, w3);  
w4 = rotate(w1 ^ w13 ^ w7 ^ w5,S1);ROTATE2_F(C, D, E, A, B, w4);
w5 = rotate(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE2_F(B, C, D, E, A, w5);  


K = K2;

w6 = rotate(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(A, B, C, D, E, w6);
w7 = rotate(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(E, A, B, C, D, w7);
w8 = rotate(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(D, E, A, B, C, w8); 
w9 = rotate(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE3_F(C, D, E, A, B, w9);
w10 = rotate(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE3_F(B, C, D, E, A, w10);  
w11 = rotate(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE3_F(A, B, C, D, E, w11);  
w12 = rotate(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE3_F(E, A, B, C, D, w12); 
w13 = rotate(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE3_F(D, E, A, B, C, w13); 
w14 = rotate(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE3_F(C, D, E, A, B, w14); 
SIZE = rotate(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE3_F(B, C, D, E, A, SIZE);
w16 = rotate(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE3_F(A, B, C, D, E, w16);
w0 = rotate(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE3_F(E, A, B, C, D, w0); 
w1 = rotate(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE3_F(D, E, A, B, C, w1);
w2 = rotate(w16 ^ w11 ^ w5 ^ w3, S1); ROTATE3_F(C, D, E, A, B, w2);
w3 = rotate(w0 ^ w12 ^ w6 ^ w4, S1); ROTATE3_F(B, C, D, E, A, w3); 
w4 = rotate(w1 ^ w13 ^ w7 ^ w5, S1); ROTATE3_F(A, B, C, D, E, w4); 
w5 = rotate(w2 ^ w14 ^ w8 ^ w6, S1); ROTATE3_F(E, A, B, C, D, w5); 
w6 = rotate(w3 ^ SIZE ^ w9 ^ w7, S1); ROTATE3_F(D, E, A, B, C, w6);
w7 = rotate(w4 ^ w16 ^ w10 ^ w8, S1); ROTATE3_F(C, D, E, A, B, w7);
w8 = rotate(w5 ^ w0 ^ w11 ^ w9, S1); ROTATE3_F(B, C, D, E, A, w8); 


K = K3;
w9 = rotate(w6 ^ w1 ^ w12 ^ w10, S1); ROTATE4_F(A, B, C, D, E, w9);
w10 = rotate(w7 ^ w2 ^ w13 ^ w11, S1); ROTATE4_F(E, A, B, C, D, w10);  
w11 = rotate(w8 ^ w3 ^ w14 ^ w12, S1); ROTATE4_F(D, E, A, B, C, w11);  
w12 = rotate(w9 ^ w4 ^ SIZE ^ w13, S1); ROTATE4_F(C, D, E, A, B, w12); 
w13 = rotate(w10 ^ w5 ^ w16 ^ w14, S1); ROTATE4_F(B, C, D, E, A, w13); 
w14 = rotate(w11 ^ w6 ^ w0 ^ SIZE, S1); ROTATE4_F(A, B, C, D, E, w14); 
SIZE = rotate(w12 ^ w7 ^ w1 ^ w16, S1); ROTATE4_F(E, A, B, C, D, SIZE);
w16 = rotate(w13 ^ w8 ^ w2 ^ w0, S1); ROTATE4_F(D, E, A, B, C, w16);
w0 = rotate(w14 ^ w9 ^ w3 ^ w1, S1); ROTATE4_F(C, D, E, A, B, w0); 
w1 = rotate(SIZE ^ w10 ^ w4 ^ w2, S1); ROTATE4_F(B, C, D, E, A, w1);
w2 = rotate(w16 ^ w11 ^ w5 ^ w3,S1); ROTATE4_F(A, B, C, D, E, w2); 
w3 = rotate(w0 ^ w12 ^ w6 ^ w4,S1); ROTATE4_F(E, A, B, C, D, w3);  
w4 = rotate(w1 ^ w13 ^ w7 ^ w5,S1); ROTATE4_F(D, E, A, B, C, w4);  
w5 = rotate(w2 ^ w14 ^ w8 ^ w6,S1); ROTATE4_F(C, D, E, A, B, w5);  
w6 = rotate(w3 ^ SIZE ^ w9 ^ w7,S1); ROTATE4_F(B, C, D, E, A, w6); 
w7 = rotate(w4 ^ w16 ^ w10 ^ w8,S1); ROTATE4_F(A, B, C, D, E, w7); 
#ifdef SINGLE_MODE
if (all((uint4)singlehash.y != E)) return;
#endif
w8 = rotate(w5 ^ w0 ^ w11 ^ w9,S1); ROTATE4_F(E, A, B, C, D, w8);  
w9 = rotate(w6 ^ w1 ^ w12 ^ w10,S1); ROTATE4_F(D, E, A, B, C, w9); 
w10 = rotate(w7 ^ w2 ^ w13 ^ w11,S1); ROTATE4_F(C, D, E, A, B, w10);
w11 = rotate(w8 ^ w3 ^ w14 ^ w12,S1); ROTATE4_F(B, C, D, E, A, w11);

#ifdef SINGLE_MODE
id=0;
if ((singlehash.z==C.s0)&&(singlehash.w==D.s0)) id = 1; 
if ((singlehash.z==C.s1)&&(singlehash.w==D.s1)) id = 1; 
if ((singlehash.z==C.s2)&&(singlehash.w==D.s2)) id = 1; 
if ((singlehash.z==C.s3)&&(singlehash.w==D.s3)) id = 1; 
if (id==0) return;
#endif

A=A+H0;B=B+H1;C=C+H2;D=D+H3;E=E+H4;

Endian_Reverse32(A);
Endian_Reverse32(B);
Endian_Reverse32(C);
Endian_Reverse32(D);
Endian_Reverse32(E);

#ifndef SINGLE_MODE
id=0;
b1=A.s0;b2=B.s0;b3=C.s0;b4=D.s0;
b5=(singlehash.x >> (B.s0&31))&1;
b6=(singlehash.y >> (C.s0&31))&1;
b7=(singlehash.z >> (D.s0&31))&1;
if ((b7) && (b5) && (b6)) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) && ((bitmaps[(16*65535)+(b3>>13)]>>(b3&31))&1) && (
(bitmaps[(24*65535)+(b4>>13)]>>(b4&31))&1) ) id=1;
b1=A.s1;b2=B.s1;b3=C.s1;b4=D.s1;
b5=(singlehash.x >> (B.s1&31))&1;
b6=(singlehash.y >> (C.s1&31))&1;
b7=(singlehash.z >> (D.s1&31))&1;
if ((b7) && (b5) && (b6)) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) && ((bitmaps[(16*65535)+(b3>>13)]>>(b3&31))&1) && (
(bitmaps[(24*65535)+(b4>>13)]>>(b4&31))&1) ) id=1;
b1=A.s2;b2=B.s2;b3=C.s2;b4=D.s2;
b5=(singlehash.x >> (B.s2&31))&1;
b6=(singlehash.y >> (C.s2&31))&1;
b7=(singlehash.z >> (D.s2&31))&1;
if ((b7) && (b5) && (b6)) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) && ((bitmaps[(16*65535)+(b3>>13)]>>(b3&31))&1) && ((bitmaps[(24*65535)+(b4>>13)]>>(b4&31))&1) ) id=1;
b1=A.s3;b2=B.s3;b3=C.s3;b4=D.s3;
b5=(singlehash.x >> (B.s3&31))&1;
b6=(singlehash.y >> (C.s3&31))&1;
b7=(singlehash.z >> (D.s3&31))&1;
if ((b7) && (b5) && (b6)) if ( ((bitmaps[b1>>13]>>(b1&31))&1) && ((bitmaps[65535*8+(b2>>13)]>>(b2&31))&1) && ((bitmaps[(16*65535)+(b3>>13)]>>(b3&31))&1) && ((bitmaps[(24*65535)+(b4>>13)]>>(b4&31))&1) ) id=1;

if (id==0) return;
#endif

if (id==1) 
{
found[0] = 1;
found_ind[get_global_id(0)] = 1;
}

#ifndef DOUBLE
dst[(get_global_id(0)*5)] = (uint4)(A.s0,B.s0,C.s0,D.s0);  
dst[(get_global_id(0)*5)+1] = (uint4)(E.s0,A.s1,B.s1,C.s1);
dst[(get_global_id(0)*5)+2] = (uint4)(D.s1,E.s1,A.s2,B.s2);
dst[(get_global_id(0)*5)+3] = (uint4)(C.s2,D.s2,E.s2,A.s3);
dst[(get_global_id(0)*5)+4] = (uint4)(B.s3,C.s3,D.s3,E.s3);
#else
dst[(get_global_id(0)*10)+factor] = (uint4)(A.s0,B.s0,C.s0,D.s0);  
dst[(get_global_id(0)*10)+1+factor] = (uint4)(E.s0,A.s1,B.s1,C.s1);
dst[(get_global_id(0)*10)+2+factor] = (uint4)(D.s1,E.s1,A.s2,B.s2);
dst[(get_global_id(0)*10)+3+factor] = (uint4)(C.s2,D.s2,E.s2,A.s3);
dst[(get_global_id(0)*10)+4+factor] = (uint4)(B.s3,C.s3,D.s3,E.s3);
#endif
}

__kernel  
__attribute__((reqd_work_group_size(64, 1, 1))) 
void sha1_short( __global uint4 *dst,const uint4 input,const uint size, const uint8 chbase, __global uint *found_ind, __global uint *bitmaps, __global uint *found, __global uint *table, const uint4 singlehash) 
{
uint i;
uint4 chbase1;
i = table[get_global_id(0)];
chbase1 = (uint4)(chbase.s0,chbase.s1,chbase.s2,chbase.s3);
sha1_short1(dst, input, size, chbase1, found_ind, bitmaps, found, i, singlehash, 0);
#ifdef DOUBLE
chbase1 = (uint4)(chbase.s4,chbase.s5,chbase.s6,chbase.s7);
sha1_short1(dst, input, size, chbase1, found_ind, bitmaps, found, i, singlehash, 5);
#endif
}