cmd_arch/arm/vfp/vfpsingle.o := ccache /home/ananjaser/Desktop/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,arch/arm/vfp/.vfpsingle.o.d  -nostdinc -isystem /home/ananjaser/Desktop/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.8/include -I/home/ananjaser/Desktop/RefinedNougat/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/ananjaser/Desktop/RefinedNougat/include/uapi -Iinclude/generated/uapi -include /home/ananjaser/Desktop/RefinedNougat/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Wno-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Wno-error=declaration-after-statement -Wno-sequence-point -Wno-unused-variable -std=gnu89 -DANDROID_VERSION=70000 -DANDROID_MAJOR_VERSION=7 -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -fno-PIE -O2 -Wno-maybe-uninitialized -Wno-unused-variable -Wno-unused-function --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(vfpsingle)"  -D"KBUILD_MODNAME=KBUILD_STR(vfp)" -c -o arch/arm/vfp/vfpsingle.o arch/arm/vfp/vfpsingle.c

source_arch/arm/vfp/vfpsingle.o := arch/arm/vfp/vfpsingle.c

deps_arch/arm/vfp/vfpsingle.o := \
  include/linux/kernel.h \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/ananjaser/Desktop/arm-eabi-4.8/lib/gcc/arm-eabi/4.8/include/stdarg.h \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  include/linux/stringify.h \
  include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/linkage.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/uapi/linux/types.h \
  arch/arm/include/generated/asm/types.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/asm-generic/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/linux/posix_types.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi/asm/posix_types.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/asm-generic/posix_types.h \
  include/linux/bitops.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  include/linux/typecheck.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/exynos/snapshot/irq/disabled.h) \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/hwcap.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi/asm/hwcap.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/lock.h \
  include/asm-generic/bitops/le.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/uapi/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  include/uapi/linux/swab.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/swab.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/uapi/asm/swab.h \
  include/linux/byteorder/generic.h \
  include/asm-generic/bitops/ext2-atomic-setbit.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/printk.h \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/sec/bat/aut.h) \
    $(wildcard include/config/samsung/product/ship.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/sec/debug.h) \
  include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/deferred/initcalls.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/kern_levels.h \
  include/linux/dynamic_debug.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  include/uapi/linux/string.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/string.h \
  include/linux/errno.h \
  include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/asm-generic/errno.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/asm-generic/errno-base.h \
  include/uapi/linux/kernel.h \
  /home/ananjaser/Desktop/RefinedNougat/include/uapi/linux/sysinfo.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/div64.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/compiler.h \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/ananjaser/Desktop/RefinedNougat/arch/arm/include/asm/vfp.h \
  arch/arm/vfp/vfpinstr.h \
  arch/arm/vfp/vfp.h \
    $(wildcard include/config/vfpv3.h) \

arch/arm/vfp/vfpsingle.o: $(deps_arch/arm/vfp/vfpsingle.o)

$(deps_arch/arm/vfp/vfpsingle.o):
