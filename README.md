android_device_kyleveub
======================

Device tree for Galaxy Trend Lite GT-S7392L (2 SIM)
Tree forked to work in kyleveub variant

# Device Informations
```
~ # cat /proc/cpuinfo
Processor	: ARMv7 Processor rev 0 (v7l)
BogoMIPS	: 3000.73
Features	: swp half thumb fastmult vfp edsp neon vfpv3 tls 
CPU implementer	: 0x41
CPU architecture: 7
CPU variant	: 0x3
CPU part	: 0xc09
CPU revision	: 0

Hardware	: hawaii_ss_kyleve
Revision	: 0000
Serial		: 6635c0004d0a3117
~ #
```
```
~ # cat /proc/partitions
major minor  #blocks  name

 179        0    3817472 mmcblk0
 179        1       1024 mmcblk0p1
 179        2        256 mmcblk0p2
 179        3        256 mmcblk0p3
 179        4        256 mmcblk0p4
 179        5       8192 mmcblk0p5
 179        6       8192 mmcblk0p6
 179        7      19200 mmcblk0p7
 179        8        512 mmcblk0p8
 179        9       2048 mmcblk0p9
 179       10       2048 mmcblk0p10
 179       11       8192 mmcblk0p11
 179       12        512 mmcblk0p12
 179       13        512 mmcblk0p13
 179       14        256 mmcblk0p14
 179       15      20480 mmcblk0p15
 179       16     204800 mmcblk0p16
 179       17     921600 mmcblk0p17
 179       18      30720 mmcblk0p18
 179       19    2576384 mmcblk0p19
 179       32    3813376 mmcblk1
 179       33    3812352 mmcblk1p1
~ # 
```

```
~ # cat /proc/crypto
name         : ecb(arc4)
driver       : ecb(arc4-generic)
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : blkcipher
blocksize    : 1
min keysize  : 1
max keysize  : 256
ivsize       : 0
geniv        : <default>

name         : stdrng
driver       : krng
module       : kernel
priority     : 200
refcnt       : 1
selftest     : passed
type         : rng
seedsize     : 0

name         : crc32c
driver       : crc32c-generic
module       : kernel
priority     : 100
refcnt       : 2
selftest     : passed
type         : shash
blocksize    : 1
digestsize   : 4

name         : zlib
driver       : zlib-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : pcomp

name         : deflate
driver       : deflate-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : compression

name         : arc4
driver       : arc4-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 1
min keysize  : 1
max keysize  : 256

name         : aes
driver       : aes-generic
module       : kernel
priority     : 100
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 16
min keysize  : 16
max keysize  : 32

name         : twofish
driver       : twofish-generic
module       : kernel
priority     : 100
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 16
min keysize  : 16
max keysize  : 32

name         : des3_ede
driver       : des3_ede-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 8
min keysize  : 24
max keysize  : 24

name         : des
driver       : des-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 8
min keysize  : 8
max keysize  : 8

name         : sha256
driver       : sha256-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : shash
blocksize    : 64
digestsize   : 32

name         : sha224
driver       : sha224-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : shash
blocksize    : 64
digestsize   : 28

name         : sha1
driver       : sha1-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : shash
blocksize    : 64
digestsize   : 20

name         : md5
driver       : md5-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : shash
blocksize    : 64
digestsize   : 16

name         : compress_null
driver       : compress_null-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : compression

name         : digest_null
driver       : digest_null-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : shash
blocksize    : 1
digestsize   : 0

name         : ecb(cipher_null)
driver       : ecb-cipher_null
module       : kernel
priority     : 100
refcnt       : 1
selftest     : passed
type         : blkcipher
blocksize    : 1
min keysize  : 0
max keysize  : 0
ivsize       : 0
geniv        : <default>

name         : cipher_null
driver       : cipher_null-generic
module       : kernel
priority     : 0
refcnt       : 1
selftest     : passed
type         : cipher
blocksize    : 1
min keysize  : 0
max keysize  : 0

~ # 
```


