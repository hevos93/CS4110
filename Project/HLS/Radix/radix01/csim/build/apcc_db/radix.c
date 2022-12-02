/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
signed int getMax(signed int *llvm_cbe_array, signed int llvm_cbe_n);
void countingSort(signed int *llvm_cbe_array, signed int llvm_cbe_size, signed int llvm_cbe_place);
void radixsort(signed int *llvm_cbe_array, signed int llvm_cbe_size);
void radix( char *llvm_cbe_input,  char *llvm_cbe_output);


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str1[4] = "%c\n";
static  char aesl_internal__OC_str[7] = "%c\t%c\n";


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

signed int getMax(signed int *llvm_cbe_array, signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  unsigned int llvm_cbe_tmp__2;
  unsigned int llvm_cbe_tmp__2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  unsigned long long llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  signed int *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa_count = 0;
  unsigned int llvm_cbe__2e_lcssa;
  unsigned int llvm_cbe__2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @getMax\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%array, align 4, !dbg !5 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_7_count);
  llvm_cbe_tmp__1 = (unsigned int )*llvm_cbe_array;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__1);
  if ((((signed int )llvm_cbe_n) > ((signed int )1u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    llvm_cbe_tmp__2__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__1;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__1;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%8, %%.lr.ph ], [ 1, %%0  for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__6);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = phi i32 [ %%., %%.lr.ph ], [ %%1, %%0  for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_18_count);
  llvm_cbe_tmp__2 = (unsigned int )llvm_cbe_tmp__2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__2);
printf("\n. = 0x%X",llvm_cbe__2e_);
printf("\n = 0x%X",llvm_cbe_tmp__1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sext i32 %%storemerge1 to i64, !dbg !5 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__3 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i32* %%array, i64 %%4, !dbg !5 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__4 = (signed int *)(&llvm_cbe_array[(((signed long long )llvm_cbe_tmp__3))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__3));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i32* %%5, align 4, !dbg !5 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__5 = (unsigned int )*llvm_cbe_tmp__4;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%7, i32 %%6, i32 %%3, !dbg !5 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__5) > ((signed int )llvm_cbe_tmp__2))) ? ((unsigned int )llvm_cbe_tmp__5) : ((unsigned int )llvm_cbe_tmp__2));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge1, 1, !dbg !6 for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__6 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__6&4294967295ull)));
  if (((llvm_cbe_tmp__6&4294967295U) == (llvm_cbe_n&4294967295U))) {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__6;   /* for PHI node */
    llvm_cbe_tmp__2__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa = phi i32 [ %%1, %%0 ], [ %%., %%.lr.ph  for 0x%I64xth hint within @getMax  --> \n", ++aesl_llvm_cbe__2e_lcssa_count);
  llvm_cbe__2e_lcssa = (unsigned int )llvm_cbe__2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa = 0x%X",llvm_cbe__2e_lcssa);
printf("\n = 0x%X",llvm_cbe_tmp__1);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @getMax}\n");
  return llvm_cbe__2e_lcssa;
}


void countingSort(signed int *llvm_cbe_array, signed int llvm_cbe_size, signed int llvm_cbe_place) {
  static  unsigned long long aesl_llvm_cbe_count_count = 0;
  signed int llvm_cbe_count[6];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  unsigned long long llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  signed int *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa_count = 0;
  unsigned int llvm_cbe__2e_lcssa;
  unsigned int llvm_cbe__2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge19_count = 0;
  unsigned int llvm_cbe_storemerge19;
  unsigned int llvm_cbe_storemerge19__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  unsigned int llvm_cbe_tmp__13;
  unsigned int llvm_cbe_tmp__13__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  unsigned long long llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  signed int *llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  unsigned int llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond25_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge117_count = 0;
  unsigned int llvm_cbe_storemerge117;
  unsigned int llvm_cbe_storemerge117__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  unsigned long long llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  signed int *llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond24_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  signed int *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  signed int *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned int llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  signed int *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  signed int *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  signed int *llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  signed int *llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  signed int *llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  unsigned int llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  unsigned int llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  signed int *llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  unsigned int llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  unsigned int llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  signed int *llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge214_count = 0;
  unsigned int llvm_cbe_storemerge214;
  unsigned int llvm_cbe_storemerge214__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  unsigned long long llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  signed int *llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  unsigned int llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  unsigned long long llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  signed int *llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  unsigned int llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond23_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge49_2e_in_count = 0;
  unsigned int llvm_cbe_storemerge49_2e_in;
  unsigned int llvm_cbe_storemerge49_2e_in__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge49_count = 0;
  unsigned int llvm_cbe_storemerge49;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  unsigned long long llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  signed int *llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  unsigned int llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned long long llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  signed int *llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  unsigned long long llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  signed int *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge56_count = 0;
  unsigned int llvm_cbe_storemerge56;
  unsigned int llvm_cbe_storemerge56__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  unsigned long long llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  signed int *llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  signed int *llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @countingSort\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = add nsw i32 %%size, 1, !dbg !7 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__7 = (unsigned int )((unsigned int )(llvm_cbe_size&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__7&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = zext i32 %%1 to i64, !dbg !7 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__8 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__7&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = alloca i32, i64 %%2, align 16, !dbg !7 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__9 = (signed int *)(signed int *) alloca(sizeof(unsigned int ) * llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%array, align 4, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__10 = (unsigned int )*llvm_cbe_array;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sdiv i32 %%4, %%place, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_61_count);
  llvm_cbe_tmp__11 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__10) / ((signed int )llvm_cbe_place)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__11));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = srem i32 %%5, 10, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__12 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__11) % ((signed int )10u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__12));
  if ((((signed int )llvm_cbe_size) > ((signed int )1u))) {
    llvm_cbe_storemerge19__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    llvm_cbe_tmp__13__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__12;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph21;
  } else {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__12;   /* for PHI node */
    goto llvm_cbe__2e_preheader16;
  }

llvm_cbe__2e_preheader16:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa = phi i32 [ %%6, %%0 ], [ %%., %%.lr.ph21  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe__2e_lcssa_count);
  llvm_cbe__2e_lcssa = (unsigned int )llvm_cbe__2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa = 0x%X",llvm_cbe__2e_lcssa);
printf("\n = 0x%X",llvm_cbe_tmp__12);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
  if ((((signed int )llvm_cbe__2e_lcssa) > ((signed int )0u))) {
    llvm_cbe_storemerge117__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph18;
  } else {
    goto llvm_cbe__2e_preheader13;
  }

  do {     /* Syntactic loop '.lr.ph21' to make GCC happy */
llvm_cbe__2e_lr_2e_ph21:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge19 = phi i32 [ %%16, %%.lr.ph21 ], [ 1, %%0  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge19_count);
  llvm_cbe_storemerge19 = (unsigned int )llvm_cbe_storemerge19__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge19 = 0x%X",llvm_cbe_storemerge19);
printf("\n = 0x%X",llvm_cbe_tmp__19);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = phi i32 [ %%., %%.lr.ph21 ], [ %%6, %%0  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__13 = (unsigned int )llvm_cbe_tmp__13__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__13);
printf("\n. = 0x%X",llvm_cbe__2e_);
printf("\n = 0x%X",llvm_cbe_tmp__12);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%storemerge19 to i64, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_79_count);
  llvm_cbe_tmp__14 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge19);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i32* %%array, i64 %%10, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__15 = (signed int *)(&llvm_cbe_array[(((signed long long )llvm_cbe_tmp__14))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__14));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i32* %%11, align 4, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__16 = (unsigned int )*llvm_cbe_tmp__15;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = sdiv i32 %%12, %%place, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_85_count);
  llvm_cbe_tmp__17 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__16) / ((signed int )llvm_cbe_place)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__17));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = srem i32 %%13, 10, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_86_count);
  llvm_cbe_tmp__18 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__17) % ((signed int )10u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__18));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%15, i32 %%12, i32 %%9, !dbg !5 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__18) > ((signed int )llvm_cbe_tmp__13))) ? ((unsigned int )llvm_cbe_tmp__16) : ((unsigned int )llvm_cbe_tmp__13));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = add nsw i32 %%storemerge19, 1, !dbg !8 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__19 = (unsigned int )((unsigned int )(llvm_cbe_storemerge19&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__19&4294967295ull)));
  if (((llvm_cbe_tmp__19&4294967295U) == (llvm_cbe_size&4294967295U))) {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe__2e_preheader16;
  } else {
    llvm_cbe_storemerge19__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__19;   /* for PHI node */
    llvm_cbe_tmp__13__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph21;
  }

  } while (1); /* end of syntactic loop '.lr.ph21' */
llvm_cbe__2e_preheader13:
  if ((((signed int )llvm_cbe_size) > ((signed int )0u))) {
    llvm_cbe_storemerge214__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph15;
  } else {
    goto llvm_cbe__2e_preheader11;
  }

  do {     /* Syntactic loop '.lr.ph18' to make GCC happy */
llvm_cbe__2e_lr_2e_ph18:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge117 = phi i32 [ %%20, %%.lr.ph18 ], [ 0, %%.preheader16  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge117_count);
  llvm_cbe_storemerge117 = (unsigned int )llvm_cbe_storemerge117__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge117 = 0x%X",llvm_cbe_storemerge117);
printf("\n = 0x%X",llvm_cbe_tmp__22);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = sext i32 %%storemerge117 to i64, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__20 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge117);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 %%18, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_101_count);
  llvm_cbe_tmp__21 = (signed int *)(&llvm_cbe_count[(((signed long long )llvm_cbe_tmp__20))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__20));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__20) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%19, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_102_count);
  *llvm_cbe_tmp__21 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = add nsw i32 %%storemerge117, 1, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_storemerge117&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
  if (((llvm_cbe_tmp__22&4294967295U) == (llvm_cbe__2e_lcssa&4294967295U))) {
    goto llvm_cbe__2e_preheader13;
  } else {
    llvm_cbe_storemerge117__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__22;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph18;
  }

  } while (1); /* end of syntactic loop '.lr.ph18' */
llvm_cbe__2e_preheader11:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 0, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_113_count);
  llvm_cbe_tmp__23 = (signed int *)(&llvm_cbe_count[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )0ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* %%21, align 16, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__24 = (unsigned int )*llvm_cbe_tmp__23;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 1, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__25 = (signed int *)(&llvm_cbe_count[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )1ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i32* %%23, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__26 = (unsigned int )*llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = add nsw i32 %%24, %%22, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__27 = (unsigned int )((unsigned int )(llvm_cbe_tmp__26&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__24&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__27&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )1ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%25, i32* %%23, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_118_count);
  *llvm_cbe_tmp__25 = llvm_cbe_tmp__27;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 2, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_124_count);
  llvm_cbe_tmp__28 = (signed int *)(&llvm_cbe_count[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )2ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = load i32* %%26, align 8, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_125_count);
  llvm_cbe_tmp__29 = (unsigned int )*llvm_cbe_tmp__28;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%27, %%25, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_126_count);
  llvm_cbe_tmp__30 = (unsigned int )((unsigned int )(llvm_cbe_tmp__29&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__27&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__30&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )2ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%28, i32* %%26, align 8, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_127_count);
  *llvm_cbe_tmp__28 = llvm_cbe_tmp__30;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 3, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__31 = (signed int *)(&llvm_cbe_count[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )3ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = load i32* %%29, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_134_count);
  llvm_cbe_tmp__32 = (unsigned int )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = add nsw i32 %%30, %%28, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_135_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(llvm_cbe_tmp__32&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__30&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__33&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )3ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%31, i32* %%29, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_136_count);
  *llvm_cbe_tmp__31 = llvm_cbe_tmp__33;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_142_count);
  llvm_cbe_tmp__34 = (signed int *)(&llvm_cbe_count[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )4ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = load i32* %%32, align 16, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_143_count);
  llvm_cbe_tmp__35 = (unsigned int )*llvm_cbe_tmp__34;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = add nsw i32 %%33, %%31, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(llvm_cbe_tmp__35&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__33&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__36&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )4ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%34, i32* %%32, align 16, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_145_count);
  *llvm_cbe_tmp__34 = llvm_cbe_tmp__36;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 5, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_151_count);
  llvm_cbe_tmp__37 = (signed int *)(&llvm_cbe_count[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )5ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = load i32* %%35, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_152_count);
  llvm_cbe_tmp__38 = (unsigned int )*llvm_cbe_tmp__37;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add nsw i32 %%36, %%34, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_153_count);
  llvm_cbe_tmp__39 = (unsigned int )((unsigned int )(llvm_cbe_tmp__38&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__36&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__39&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )5ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%37, i32* %%35, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_154_count);
  *llvm_cbe_tmp__37 = llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 6, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_160_count);
  llvm_cbe_tmp__40 = (signed int *)(&llvm_cbe_count[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )6ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i32* %%38, align 8, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__41 = (unsigned int )*llvm_cbe_tmp__40;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = add nsw i32 %%39, %%37, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__42 = (unsigned int )((unsigned int )(llvm_cbe_tmp__41&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__39&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__42&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )6ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%40, i32* %%38, align 8, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_163_count);
  *llvm_cbe_tmp__40 = llvm_cbe_tmp__42;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__42);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 7, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_169_count);
  llvm_cbe_tmp__43 = (signed int *)(&llvm_cbe_count[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )7ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = load i32* %%41, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_170_count);
  llvm_cbe_tmp__44 = (unsigned int )*llvm_cbe_tmp__43;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = add nsw i32 %%42, %%40, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__45 = (unsigned int )((unsigned int )(llvm_cbe_tmp__44&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__42&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__45&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )7ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%43, i32* %%41, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_172_count);
  *llvm_cbe_tmp__43 = llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 8, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__46 = (signed int *)(&llvm_cbe_count[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )8ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load i32* %%44, align 16, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__47 = (unsigned int )*llvm_cbe_tmp__46;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__47);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = add nsw i32 %%45, %%43, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__48 = (unsigned int )((unsigned int )(llvm_cbe_tmp__47&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__45&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__48&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )8ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%46, i32* %%44, align 16, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_181_count);
  *llvm_cbe_tmp__46 = llvm_cbe_tmp__48;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 9, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_187_count);
  llvm_cbe_tmp__49 = (signed int *)(&llvm_cbe_count[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )9ull) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i32* %%47, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_188_count);
  llvm_cbe_tmp__50 = (unsigned int )*llvm_cbe_tmp__49;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = add nsw i32 %%48, %%46, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_189_count);
  llvm_cbe_tmp__51 = (unsigned int )((unsigned int )(llvm_cbe_tmp__50&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__48&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__51&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )9ull) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%49, i32* %%47, align 4, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_190_count);
  *llvm_cbe_tmp__49 = llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
  if ((((signed int )llvm_cbe_size) > ((signed int )0u))) {
    llvm_cbe_storemerge49_2e_in__PHI_TEMPORARY = (unsigned int )llvm_cbe_size;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph10;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph15' to make GCC happy */
llvm_cbe__2e_lr_2e_ph15:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge214 = phi i32 [ %%59, %%.lr.ph15 ], [ 0, %%.preheader13  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge214_count);
  llvm_cbe_storemerge214 = (unsigned int )llvm_cbe_storemerge214__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge214 = 0x%X",llvm_cbe_storemerge214);
printf("\n = 0x%X",llvm_cbe_tmp__61);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = sext i32 %%storemerge214 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__52 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge214);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = getelementptr inbounds i32* %%array, i64 %%50, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_198_count);
  llvm_cbe_tmp__53 = (signed int *)(&llvm_cbe_array[(((signed long long )llvm_cbe_tmp__52))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__52));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = load i32* %%51, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_199_count);
  llvm_cbe_tmp__54 = (unsigned int )*llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = sdiv i32 %%52, %%place, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_200_count);
  llvm_cbe_tmp__55 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__54) / ((signed int )llvm_cbe_place)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__55));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = srem i32 %%53, 10, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_201_count);
  llvm_cbe_tmp__56 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__55) % ((signed int )10u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__56));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = sext i32 %%54 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_202_count);
  llvm_cbe_tmp__57 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 %%55, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_203_count);
  llvm_cbe_tmp__58 = (signed int *)(&llvm_cbe_count[(((signed long long )llvm_cbe_tmp__57))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__57));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__57) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = load i32* %%56, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__59 = (unsigned int )*llvm_cbe_tmp__58;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = add nsw i32 %%57, 1, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__60 = (unsigned int )((unsigned int )(llvm_cbe_tmp__59&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__60&4294967295ull)));

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__57) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%58, i32* %%56, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_206_count);
  *llvm_cbe_tmp__58 = llvm_cbe_tmp__60;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add nsw i32 %%storemerge214, 1, !dbg !9 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_207_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(llvm_cbe_storemerge214&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
  if (((llvm_cbe_tmp__61&4294967295U) == (llvm_cbe_size&4294967295U))) {
    goto llvm_cbe__2e_preheader11;
  } else {
    llvm_cbe_storemerge214__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__61;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph15;
  }

  } while (1); /* end of syntactic loop '.lr.ph15' */
llvm_cbe__2e_preheader:
  if ((((signed int )llvm_cbe_size) > ((signed int )0u))) {
    llvm_cbe_storemerge56__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph10' to make GCC happy */
llvm_cbe__2e_lr_2e_ph10:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge49.in = phi i32 [ %%storemerge49, %%.lr.ph10 ], [ %%size, %%.preheader11  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge49_2e_in_count);
  llvm_cbe_storemerge49_2e_in = (unsigned int )llvm_cbe_storemerge49_2e_in__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge49.in = 0x%X",llvm_cbe_storemerge49_2e_in);
printf("\nstoremerge49 = 0x%X",llvm_cbe_storemerge49);
printf("\nsize = 0x%X",llvm_cbe_size);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge49 = add nsw i32 %%storemerge49.in, -1, !dbg !10 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge49_count);
  llvm_cbe_storemerge49 = (unsigned int )((unsigned int )(llvm_cbe_storemerge49_2e_in&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge49 = 0x%X\n", ((unsigned int )(llvm_cbe_storemerge49&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = sext i32 %%storemerge49 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_219_count);
  llvm_cbe_tmp__62 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge49);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = getelementptr inbounds i32* %%array, i64 %%60, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_220_count);
  llvm_cbe_tmp__63 = (signed int *)(&llvm_cbe_array[(((signed long long )llvm_cbe_tmp__62))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__62));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = load i32* %%61, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_221_count);
  llvm_cbe_tmp__64 = (unsigned int )*llvm_cbe_tmp__63;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = sdiv i32 %%62, %%place, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_222_count);
  llvm_cbe_tmp__65 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__64) / ((signed int )llvm_cbe_place)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__65));
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = srem i32 %%63, 10, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__66 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__65) % ((signed int )10u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__66));
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = sext i32 %%64 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__67 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__67);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = getelementptr inbounds [6 x i32]* %%count, i64 0, i64 %%65, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_225_count);
  llvm_cbe_tmp__68 = (signed int *)(&llvm_cbe_count[(((signed long long )llvm_cbe_tmp__67))
#ifdef AESL_BC_SIM
 % 6
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__67));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__67) < 6)) fprintf(stderr, "%s:%d: warning: Read access out of array 'count' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = load i32* %%66, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_226_count);
  llvm_cbe_tmp__69 = (unsigned int )*llvm_cbe_tmp__68;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = add nsw i32 %%67, -1, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_227_count);
  llvm_cbe_tmp__70 = (unsigned int )((unsigned int )(llvm_cbe_tmp__69&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__70&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = sext i32 %%68 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_228_count);
  llvm_cbe_tmp__71 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__70);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__71);
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = getelementptr inbounds i32* %%3, i64 %%69, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_229_count);
  llvm_cbe_tmp__72 = (signed int *)(&llvm_cbe_tmp__9[(((signed long long )llvm_cbe_tmp__71))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__71));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%62, i32* %%70, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_230_count);
  *llvm_cbe_tmp__72 = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__67) < 6 && "Write access out of array 'count' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%68, i32* %%66, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_231_count);
  *llvm_cbe_tmp__68 = llvm_cbe_tmp__70;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__70);
  if ((((signed int )llvm_cbe_storemerge49) > ((signed int )0u))) {
    llvm_cbe_storemerge49_2e_in__PHI_TEMPORARY = (unsigned int )llvm_cbe_storemerge49;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph10;
  } else {
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.lr.ph10' */
  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge56 = phi i32 [ %%76, %%.lr.ph ], [ 0, %%.preheader  for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_storemerge56_count);
  llvm_cbe_storemerge56 = (unsigned int )llvm_cbe_storemerge56__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge56 = 0x%X",llvm_cbe_storemerge56);
printf("\n = 0x%X",llvm_cbe_tmp__77);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = sext i32 %%storemerge56 to i64, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__73 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge56);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = getelementptr inbounds i32* %%3, i64 %%72, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__74 = (signed int *)(&llvm_cbe_tmp__9[(((signed long long )llvm_cbe_tmp__73))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__73));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = load i32* %%73, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__75 = (unsigned int )*llvm_cbe_tmp__74;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = getelementptr inbounds i32* %%array, i64 %%72, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_237_count);
  llvm_cbe_tmp__76 = (signed int *)(&llvm_cbe_array[(((signed long long )llvm_cbe_tmp__73))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__73));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%74, i32* %%75, align 4, !dbg !6 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_238_count);
  *llvm_cbe_tmp__76 = llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = add nsw i32 %%storemerge56, 1, !dbg !10 for 0x%I64xth hint within @countingSort  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__77 = (unsigned int )((unsigned int )(llvm_cbe_storemerge56&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__77&4294967295ull)));
  if (((llvm_cbe_tmp__77&4294967295U) == (llvm_cbe_size&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge56__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__77;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @countingSort}\n");
  return;
}


void radixsort(signed int *llvm_cbe_array, signed int llvm_cbe_size) {
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned int llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  unsigned int llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @radixsort\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @getMax(i32* %%array, i32 %%size), !dbg !5 for 0x%I64xth hint within @radixsort  --> \n", ++aesl_llvm_cbe_253_count);
  llvm_cbe_tmp__78 = (unsigned int ) /*tail*/ getMax((signed int *)llvm_cbe_array, llvm_cbe_size);
if (AESL_DEBUG_TRACE) {
printf("\nArgument size = 0x%X",llvm_cbe_size);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__78);
}
  if ((((signed int )llvm_cbe_tmp__78) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%3, %%.lr.ph ], [ 1, %%0  for 0x%I64xth hint within @radixsort  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__79);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @countingSort(i32* %%array, i32 %%size, i32 %%storemerge1), !dbg !5 for 0x%I64xth hint within @radixsort  --> \n", ++aesl_llvm_cbe_262_count);
   /*tail*/ countingSort((signed int *)llvm_cbe_array, llvm_cbe_size, llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE) {
printf("\nArgument size = 0x%X",llvm_cbe_size);
printf("\nArgument storemerge1 = 0x%X",llvm_cbe_storemerge1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = mul nsw i32 %%storemerge1, 10, !dbg !6 for 0x%I64xth hint within @radixsort  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__79 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) * ((unsigned int )(10u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__79&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sdiv i32 %%1, %%3, !dbg !5 for 0x%I64xth hint within @radixsort  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__80 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__78) / ((signed int )llvm_cbe_tmp__79)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__80));
  if ((((signed int )llvm_cbe_tmp__80) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__79;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @radixsort}\n");
  return;
}


void radix( char *llvm_cbe_input,  char *llvm_cbe_output) {
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
   char llvm_cbe_tmp__81[8];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  unsigned char llvm_cbe_tmp__82;
  unsigned char llvm_cbe_tmp__82__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge12_count = 0;
  unsigned char llvm_cbe_storemerge12;
  unsigned char llvm_cbe_storemerge12__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  unsigned long long llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
   char *llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  unsigned char llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  unsigned long long llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
   char *llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  unsigned int llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  unsigned int llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  unsigned char llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  unsigned char llvm_cbe_tmp__93;
  unsigned char llvm_cbe_tmp__93__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned char llvm_cbe_storemerge;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  signed int *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  unsigned long long llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  unsigned char llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @radix\n");
  llvm_cbe_tmp__82__PHI_TEMPORARY = (unsigned char )((unsigned char )0);   /* for PHI node */
  llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned char )((unsigned char )0);   /* for PHI node */
  goto llvm_cbe_tmp__97;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__97:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = phi i8 [ 0, %%0 ], [ %%17, %%16  for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_297_count);
  llvm_cbe_tmp__82 = (unsigned char )llvm_cbe_tmp__82__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__82);
printf("\n = 0x%X",((unsigned char )0));
printf("\n = 0x%X",llvm_cbe_tmp__93);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge12 = phi i8 [ 0, %%0 ], [ %%storemerge, %%16  for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_storemerge12_count);
  llvm_cbe_storemerge12 = (unsigned char )llvm_cbe_storemerge12__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge12 = 0x%X",llvm_cbe_storemerge12);
printf("\n = 0x%X",((unsigned char )0));
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = zext i8 %%storemerge12 to i64, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_298_count);
  llvm_cbe_tmp__83 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_storemerge12&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__83);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i8* %%input, i64 %%4, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_299_count);
  llvm_cbe_tmp__84 = ( char *)(&llvm_cbe_input[(((signed long long )llvm_cbe_tmp__83))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__83));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i8* %%5, align 1, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_300_count);
  llvm_cbe_tmp__85 = (unsigned char )*llvm_cbe_tmp__84;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i8 %%6 to i32, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_301_count);
  llvm_cbe_tmp__86 = (unsigned int )((signed int )( char )llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @aesl_internal_.str, i64 0, i64 0), i32 %%7, i32 %%7) nounwind, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_302_count);
  printf(( char *)((&aesl_internal__OC_str[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 7
#endif
])), llvm_cbe_tmp__86, llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__86);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__86);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__87);
}
  if (((llvm_cbe_tmp__85&255U) == (((unsigned char )44)&255U))) {
    llvm_cbe_tmp__93__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__82;   /* for PHI node */
    goto llvm_cbe_tmp__98;
  } else {
    goto llvm_cbe_tmp__99;
  }

llvm_cbe_tmp__98:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = phi i8 [ %%15, %%10 ], [ %%3, %%2  for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_317_count);
  llvm_cbe_tmp__93 = (unsigned char )llvm_cbe_tmp__93__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__93);
printf("\n = 0x%X",llvm_cbe_tmp__92);
printf("\n = 0x%X",llvm_cbe_tmp__82);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = add i8 %%storemerge12, 1, !dbg !7 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_storemerge12&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge = 0x%X\n", ((unsigned char )(llvm_cbe_storemerge&255ull)));
  if (((llvm_cbe_storemerge&255U) == (((unsigned char )8)&255U))) {
    goto llvm_cbe_tmp__100;
  } else {
    llvm_cbe_tmp__82__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__93;   /* for PHI node */
    llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned char )llvm_cbe_storemerge;   /* for PHI node */
    goto llvm_cbe_tmp__97;
  }

llvm_cbe_tmp__99:
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = zext i8 %%3 to i64, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_306_count);
  llvm_cbe_tmp__88 = (unsigned long long )((unsigned long long )(unsigned char )llvm_cbe_tmp__82&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__88);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [8 x i8]* %%1, i64 0, i64 %%11, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_307_count);
  llvm_cbe_tmp__89 = ( char *)(&llvm_cbe_tmp__81[(((signed long long )llvm_cbe_tmp__88))
#ifdef AESL_BC_SIM
 % 8
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%I64X",((signed long long )llvm_cbe_tmp__88));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__88) < 8 && "Write access out of array '' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%6, i8* %%12, align 1, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_308_count);
  *llvm_cbe_tmp__89 = llvm_cbe_tmp__85;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = zext i8 %%6 to i32, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_309_count);
  llvm_cbe_tmp__90 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__85&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str1, i64 0, i64 0), i32 %%13) nounwind, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_310_count);
  printf(( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__90);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__91);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add i8 %%3, 1, !dbg !6 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_311_count);
  llvm_cbe_tmp__92 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__82&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__92&255ull)));
  llvm_cbe_tmp__93__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__92;   /* for PHI node */
  goto llvm_cbe_tmp__98;

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__100:
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = bitcast [8 x i8]* %%1 to i32*, !dbg !8 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_330_count);
  llvm_cbe_tmp__94 = (signed int *)((signed int *)(&llvm_cbe_tmp__81));
if (AESL_DEBUG_TRACE)
printf("\n  call void @radixsort(i32* %%19, i32 8), !dbg !8 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_332_count);
  radixsort((signed int *)llvm_cbe_tmp__94, 8u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",8u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = ptrtoint [8 x i8]* %%1 to i64, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_333_count);
  llvm_cbe_tmp__95 = (unsigned long long )((unsigned long long )(unsigned long)(&llvm_cbe_tmp__81)&18446744073709551615ULL);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = trunc i64 %%20 to i8, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_334_count);
  llvm_cbe_tmp__96 = (unsigned char )((unsigned char )llvm_cbe_tmp__95&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%21, i8* %%output, align 1, !dbg !5 for 0x%I64xth hint within @radix  --> \n", ++aesl_llvm_cbe_335_count);
  *llvm_cbe_output = llvm_cbe_tmp__96;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @radix}\n");
  return;
}

