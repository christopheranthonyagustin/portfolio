///
///  @file vmPtr.h
///  
///
///  Created by TC Tan on 4/2/14.
///  Copyright (c) 2014 V-Key Pte Ltd. All rights reserved.
///


#ifndef VMPTR_H
#define VMPTR_H

#include "vosInterface.h"

typedef struct vmPtr {
    unsigned char *addr_real;/**< native address of the buffer. Can be used to copy data from native memory to VM. */
    int addr_vm;/**< V-OS VM's address of the buffer. Can be used as a pointer inside VM's code. */
} vmPtr;

/*----------------------interface declaration-------------------------------------------*/
/** This function allocates a buffer in shared stack memory region of VM.
 *	<p>
 *	Notes:	- The allocator works using a FILO mechanism. 
 *			That means the buffers must be deallocated in a reversed order with respect to their allocations' order.
 *	</p>
 *	@param	vmHandle	Pointer to the V-OS virtual machine.
 *	@param	malloc_size	Size of buffer in bytes to be allocated.
 *	@return				A VM pointer of type <code>vmPtr</code>. It will points to the allocated buffer.
 *						If the allocation fails, both <code>addr_real</code> and <code>addr_vm</code> of the returned pointer will be zero.
 */
VOS_API vmPtr vm_malloc(void * vmHandle, unsigned int malloc_size);

/** This function deallocates a buffer in shared stack memory region of VM.
 *	<p>
 *	Notes:	- The allocator works using a FILO mechanism.
 *			That means the buffers must be deallocated in a reversed order with respect to their allocations' order.
 *			For e.g. Last allocated buffer must be deallocated first. First allocated buffer must be deallocated last.
 *			- This function can deallocate multiple buffers at the same time. 
 *			Just pass the accumulated size of the buffers to <code>malloc_size</code> argument.
 *	</p>
 *	@param	vmHandle	Pointer to the V-OS virtual machine.
 *	@param	malloc_size	Size of the allocated buffer in bytes.
 *	@return				Nothing.
 */
VOS_API void vm_free(void * vmHandle, unsigned int malloc_size);

/*--------------------obfuscated function names -----------------------------------------*/
#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define vm_malloc_impl vosInterface_new_name(109)
#define vm_free_impl vosInterface_new_name(110)
VOS_EXPORT vmPtr vm_malloc_impl(void * vmHandle, unsigned int malloc_size);
VOS_EXPORT void vm_free_impl(void * vmHandle, unsigned int malloc_size);

#ifdef __cplusplus
} //extern "C" 
#endif

/*-----inline delegation----------*/
VOS_API vmPtr vm_malloc(void * vmHandle, unsigned int malloc_size){
    return vm_malloc_impl(vmHandle, malloc_size);
}
VOS_API void vm_free(void * vmHandle, unsigned int malloc_size){
    return vm_free_impl(vmHandle, malloc_size);
}

#endif //#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
