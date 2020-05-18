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

#ifndef LOADER_ARCH_CONTEXT_H
#define LOADER_ARCH_CONTEXT_H

#include <loader_types.h>

/** @brief used to state that the VMM has been started on a cpu */
#define VMM_STARTED 1U

/**
 * @class loader_arch_context
 *
 * <!-- description -->
 *   @brief Provides all of the information that is needed by the kernel to
 *     start the hypervisor and return back to the root OS once the
 *     hypevisor is running on a specific CPU (meaning each CPU has its own
 *     version of this structure). This structure will eventually be given
 *     to the kernel, and the kernel will use this information to properly
 *     configure hardware virtualization extensions for a given CPU arch.
 */
struct loader_arch_context_t
{
    /** @brief set to 1 when the VMM is running on this CPU, 0 otherwise */
    uint8_t started;
};

#endif
