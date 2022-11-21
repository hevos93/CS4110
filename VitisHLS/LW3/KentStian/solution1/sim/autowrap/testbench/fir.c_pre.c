# 1 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.c"
# 1 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.c" 1
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 147 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.c" 2


# 1 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.h" 1




# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/include\\stdint.h" 1 3 4
# 34 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/include\\stdint.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\stdint.h" 1 3 4
# 29 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\stdint.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 1 3 4
# 11 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include/_mingw_mac.h" 1 3 4
# 11 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 2 3 4
# 278 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\vadefs.h" 1 3 4
# 14 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\vadefs.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 1 3 4
# 675 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include/sdks/_mingw_directx.h" 1 3 4
# 675 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 2 3 4

# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include/sdks/_mingw_ddk.h" 1 3 4
# 676 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 2 3 4
# 14 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\vadefs.h" 2 3 4


#pragma pack(push,_CRT_PACKING)








 typedef __builtin_va_list __gnuc_va_list;






  typedef __gnuc_va_list va_list;
# 103 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\vadefs.h" 3 4
#pragma pack(pop)
# 278 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 2 3 4


#pragma pack(push,_CRT_PACKING)
# 371 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
__extension__ typedef unsigned long long size_t;
# 381 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
__extension__ typedef long long ssize_t;
# 393 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
__extension__ typedef long long intptr_t;
# 406 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
__extension__ typedef unsigned long long uintptr_t;
# 419 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
__extension__ typedef long long ptrdiff_t;
# 429 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
typedef unsigned short wchar_t;







typedef unsigned short wint_t;
typedef unsigned short wctype_t;
# 457 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
typedef int errno_t;




typedef long __time32_t;




__extension__ typedef long long __time64_t;







typedef __time64_t time_t;
# 608 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\_mingw.h" 3 4
struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct *pthreadlocinfo;
typedef struct threadmbcinfostruct *pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct {
  pthreadlocinfo locinfo;
  pthreadmbcinfo mbcinfo;
} _locale_tstruct,*_locale_t;



typedef struct tagLC_ID {
  unsigned short wLanguage;
  unsigned short wCountry;
  unsigned short wCodePage;
} LC_ID,*LPLC_ID;




typedef struct threadlocaleinfostruct {
  int refcount;
  unsigned int lc_codepage;
  unsigned int lc_collate_cp;
  unsigned long lc_handle[6];
  LC_ID lc_id[6];
  struct {
    char *locale;
    wchar_t *wlocale;
    int *refcount;
    int *wrefcount;
  } lc_category[6];
  int lc_clike;
  int mb_cur_max;
  int *lconv_intl_refcount;
  int *lconv_num_refcount;
  int *lconv_mon_refcount;
  struct lconv *lconv;
  int *ctype1_refcount;
  unsigned short *ctype1;
  const unsigned short *pctype;
  const unsigned char *pclmap;
  const unsigned char *pcumap;
  struct __lc_time_data *lc_time_curr;
} threadlocinfo;







const char *__mingw_get_crt_info (void);





#pragma pack(pop)
# 29 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\stdint.h" 2 3 4




# 1 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/include\\stddef.h" 1 3 4
# 32 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/include\\stddef.h" 3 4
typedef __typeof__(((int*)0)-((int*)0)) ptrdiff_t;



typedef __typeof__(sizeof(int)) size_t;




typedef unsigned short wchar_t;
# 33 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\\stdint.h" 2 3 4



typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned uint32_t;
__extension__ typedef long long int64_t;
__extension__ typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef unsigned char uint_least8_t;
typedef short int_least16_t;
typedef unsigned short uint_least16_t;
typedef int int_least32_t;
typedef unsigned uint_least32_t;
__extension__ typedef long long int_least64_t;
__extension__ typedef unsigned long long uint_least64_t;





typedef signed char int_fast8_t;
typedef unsigned char uint_fast8_t;
typedef short int_fast16_t;
typedef unsigned short uint_fast16_t;
typedef int int_fast32_t;
typedef unsigned int uint_fast32_t;
__extension__ typedef long long int_fast64_t;
__extension__ typedef unsigned long long uint_fast64_t;


__extension__ typedef long long intmax_t;
__extension__ typedef unsigned long long uintmax_t;
# 34 "C:/Xilinx/Vitis_HLS/2022.2/win64/tools/clang/bin/../lib/clang/3.1/include\\stdint.h" 2 3 4
# 6 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.h" 2

void fir( const uint8_t input, uint8_t* output );
# 4 "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.c" 2




void fir( const uint8_t input, uint8_t* output )
{
#pragma HLS INTERFACE mode=s_axilite port=fir
#pragma HLS INTERFACE mode=s_axilite port=input
#pragma HLS INTERFACE mode=s_axilite port=output

 const float coef = 1.0f/3.0f;
 static float shift_reg[3];
 float acc = 0;

 for (int8_t i = 3 - 1; i > 0; i--)
 {
  shift_reg[i] = shift_reg[i - 1];
  acc += shift_reg[i] * coef;
 }
 acc += input * coef;
 shift_reg[0] = (float)input;
 *output = (uint8_t)(acc+0.5f);
}
