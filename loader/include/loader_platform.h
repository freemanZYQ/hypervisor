/**
 * @copyright
 * Copyright (C) 2020 Assured Information Security, Inc.
 *
 * @copyright
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * @copyright
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * @copyright
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#ifndef LOADER_PLATFORM_H
#define LOADER_PLATFORM_H

#include <loader_types.h>

/**
 * <!-- description -->
 *   @brief This function allocates read/write virtual memory from the
 *     kernel. This memory is not physically contiguous. The resulting
 *     pointer is at least 4k aligned, so use this function sparingly
 *     as it will always allocate at least one page. Use platform_free()
 *     to release this memory.
 *
 * <!-- inputs/outputs -->
 *   @param size the number of bytes to allocate
 *   @return Returns a pointer to the newly allocated memory on success.
 *     Returns a nullptr on failure.
 */
void *platform_alloc(uint64_t size);

/**
 * <!-- description -->
 *   @brief This function frees memory previously allocated using the
 *     platform_alloc() function.
 *
 * <!-- inputs/outputs -->
 *   @param ptr the pointer returned by platform_alloc(). If ptr is
 *     passed a nullptr, it will be ignored. Attempting to free memory
 *     more than once results in UB.
 *   @param size the number of bytes that were allocated. Note that this
 *     may or may not be ignored depending on the platform.
 */
void platform_free(void *ptr, uint64_t size);

/**
 * <!-- description -->
 *   @brief Given a virtual address, this function returns the virtual
 *     address's physical address. Returns NULL if the conversion failed.
 *
 * <!-- inputs/outputs -->
 *   @param virt the virtual address to convert to a physical address
 *   @return Given a virtual address, this function returns the virtual
 *     address's physical address. Returns NULL if the conversion failed.
 */
uintptr_t platform_virt_to_phys(uintptr_t virt);
/**
 * <!-- description -->
 *   @brief Sets "num" bytes in the memory pointed to by "ptr" to "val".
 *     If the provided parameters are valid, returns 0, otherwise
 *     returns FAILURE.
 *
 * <!-- inputs/outputs -->
 *   @param ptr a pointer to the memory to set
 *   @param val the value to set each byte to
 *   @param num the number of bytes in "ptr" to set to "val".
 *   @return If the provided parameters are valid, returns 0, otherwise
 *     returns FAILURE.
 */
int64_t platform_memset(void *ptr, char val, uint64_t num);

/**
 * <!-- description -->
 *   @brief Copies "num" bytes from "src" to "dst". If "src" or "dst" are
 *     NULL, returns FAILURE, otherwise returns 0.
 *
 * <!-- inputs/outputs -->
 *   @param dst a pointer to the memory to copy to
 *   @param src a pointer to the memory to copy from
 *   @param num the number of bytes to copy
 *   @return If "src" or "dst" are NULL, returns FAILURE, otherwise
 *     returns 0.
 */
int64_t platform_memcpy(void *dst, const void *src, uint64_t num);

/**
 * @brief The callback signature for platform_on_each_cpu
 */
typedef int64_t (*platform_per_cpu_func)(uint32_t);

/**
 * <!-- description -->
 *   @brief Calls the user provided callback on each CPU. If each callback
 *     returns 0, this function returns 0, otherwise this function returns
 *     a non-0 value, even if all callbacks succeed except for one. If an
 *     error occurs, it is possible that this function will continue to
 *     execute the remaining callbacks until all callbacks have been called
 *     (depends on the platform).
 *
 * <!-- inputs/outputs -->
 *   @param func the function to call on each cpu
 *   @param reverse if set to 1, will execute the func in reverse order
 *   @return If each callback returns 0, this function returns 0, otherwise
 *     this function returns a non-0 value
 */
int64_t platform_on_each_cpu(platform_per_cpu_func func, int reverse);

#endif
