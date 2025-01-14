#
# Copyright (C) 2020 Assured Information Security, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Add's CMake Arguments to the CMake Variable
#
macro(hypervisor_add_cmake_args)
    list(APPEND CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_VERBOSE_MAKEFILE=${CMAKE_VERBOSE_MAKEFILE}
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
        -DCMAKE_INSTALL_MESSAGE=LAZY
    )

    list(APPEND CMAKE_ARGS
        -Dbsl_SOURCE_DIR=${bsl_SOURCE_DIR}
        -DFETCHCONTENT_UPDATES_DISCONNECTED=${FETCHCONTENT_UPDATES_DISCONNECTED}
        -DFETCHCONTENT_SOURCE_DIR_BSL=${FETCHCONTENT_SOURCE_DIR_BSL}
    )

    list(APPEND CMAKE_ARGS
        -DBUILD_EXAMPLES=${BUILD_EXAMPLES}
        -DBUILD_TESTS=${BUILD_TESTS}
        -DENABLE_CLANG_FORMAT=${ENABLE_CLANG_FORMAT}
        -DENABLE_DOXYGEN=${ENABLE_DOXYGEN}
        -DENABLE_COLOR=${ENABLE_COLOR}
        -DBSL_DEBUG_LEVEL=${BSL_DEBUG_LEVEL}
        -DBSL_PAGE_SIZE=${BSL_PAGE_SIZE}
    )

    list(APPEND CMAKE_ARGS
        -DHYPERVISOR_EXTENSIONS=${HYPERVISOR_EXTENSIONS}
        -DHYPERVISOR_EXTENSIONS_DIR=${HYPERVISOR_EXTENSIONS_DIR}
        -DHYPERVISOR_TARGET_ARCH=${HYPERVISOR_TARGET_ARCH}
        -DHYPERVISOR_CXX_LINKER=${HYPERVISOR_CXX_LINKER}
        -DHYPERVISOR_EFI_LINKER=${HYPERVISOR_EFI_LINKER}
        -DHYPERVISOR_EFI_FS0=${HYPERVISOR_EFI_FS0}
        -DHYPERVISOR_PAGE_SIZE=${HYPERVISOR_PAGE_SIZE}
        -DHYPERVISOR_PAGE_SHIFT=${HYPERVISOR_PAGE_SHIFT}
        -DHYPERVISOR_SERIAL_PORT=${HYPERVISOR_SERIAL_PORT}
        -DHYPERVISOR_MAX_ELF_FILE_SIZE=${HYPERVISOR_MAX_ELF_FILE_SIZE}
        -DHYPERVISOR_MAX_SEGMENTS=${HYPERVISOR_MAX_SEGMENTS}
        -DHYPERVISOR_MAX_EXTENSIONS=${HYPERVISOR_MAX_EXTENSIONS}
        -DHYPERVISOR_MAX_VMS=${HYPERVISOR_MAX_VMS}
        -DHYPERVISOR_MAX_PPS=${HYPERVISOR_MAX_PPS}
        -DHYPERVISOR_MAX_VPS=${HYPERVISOR_MAX_VPS}
        -DHYPERVISOR_MAX_VPS_PER_VM=${HYPERVISOR_MAX_VPS_PER_VM}
        -DHYPERVISOR_MAX_VPSS_PER_VP=${HYPERVISOR_MAX_VPSS_PER_VP}
        -DHYPERVISOR_MAX_VPSS=${HYPERVISOR_MAX_VPSS}
        -DHYPERVISOR_DEBUG_RING_SIZE=${HYPERVISOR_DEBUG_RING_SIZE}
        -DHYPERVISOR_DIRECT_MAP_ADDR=${HYPERVISOR_DIRECT_MAP_ADDR}
        -DHYPERVISOR_MK_STACK_ADDR=${HYPERVISOR_MK_STACK_ADDR}
        -DHYPERVISOR_MK_STACK_SIZE=${HYPERVISOR_MK_STACK_SIZE}
        -DHYPERVISOR_MK_CODE_ADDR=${HYPERVISOR_MK_CODE_ADDR}
        -DHYPERVISOR_MK_CODE_SIZE=${HYPERVISOR_MK_CODE_SIZE}
        -DHYPERVISOR_MK_MAP_ADDR=${HYPERVISOR_MK_MAP_ADDR}
        -DHYPERVISOR_MK_MAP_SIZE=${HYPERVISOR_MK_MAP_SIZE}
        -DHYPERVISOR_EXT_STACK_ADDR=${HYPERVISOR_EXT_STACK_ADDR}
        -DHYPERVISOR_EXT_STACK_SIZE=${HYPERVISOR_EXT_STACK_SIZE}
        -DHYPERVISOR_EXT_CODE_ADDR=${HYPERVISOR_EXT_CODE_ADDR}
        -DHYPERVISOR_EXT_CODE_SIZE=${HYPERVISOR_EXT_CODE_SIZE}
        -DHYPERVISOR_EXT_TLS_ADDR=${HYPERVISOR_EXT_TLS_ADDR}
        -DHYPERVISOR_EXT_TLS_SIZE=${HYPERVISOR_EXT_TLS_SIZE}
        -DHYPERVISOR_EXT_PAGE_POOL_ADDR=${HYPERVISOR_EXT_PAGE_POOL_ADDR}
        -DHYPERVISOR_EXT_PAGE_POOL_SIZE=${HYPERVISOR_EXT_PAGE_POOL_SIZE}
        -DHYPERVISOR_EXT_HEAP_POOL_ADDR=${HYPERVISOR_EXT_HEAP_POOL_ADDR}
        -DHYPERVISOR_EXT_HEAP_POOL_SIZE=${HYPERVISOR_EXT_HEAP_POOL_SIZE}
        -DHYPERVISOR_HUGE_POOL_SIZE=${HYPERVISOR_HUGE_POOL_SIZE}
        -DHYPERVISOR_PAGE_POOL_SIZE=${HYPERVISOR_PAGE_POOL_SIZE}
    )
endmacro(hypervisor_add_cmake_args)
