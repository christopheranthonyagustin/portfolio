//
//  vosInterface_datastore.h
//  V-OS 3.0
//
//  Created by Le Hoang Quyen on 13/3/15.
//  Copyright (c) 2015 V-Key. All rights reserved.
//

#ifndef V_OS_3_0_vosInterface_datastore_h
#define V_OS_3_0_vosInterface_datastore_h

#include "vmPtr.h"

#include "vosInterface.h"

/*----------------------interface declaration-------------------------------------------*/

VOS_API int vosInterface_datastore_setup(void *vmhandle);


/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_datastore_UUID _16923bf24c2b4257b579fcc6bffd0844 //_1b0d64cc38ac42f3b70024c8f9ae1a68


#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_datastore_new_name(idx) VOS_CONCAT_DEF(vosInterface_datastore_UUID, idx, 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION
#ifdef __cplusplus
extern "C" {
#endif

#define vosInterface_datastore_setup_impl vosInterface_datastore_new_name(68)
VOS_EXPORT int vosInterface_datastore_setup_impl (void *vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

/*----------inline implementation -----------*/
VOS_API
int vosInterface_datastore_setup(void *vmhandle)
{
    return vosInterface_datastore_setup_impl(vmhandle);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
