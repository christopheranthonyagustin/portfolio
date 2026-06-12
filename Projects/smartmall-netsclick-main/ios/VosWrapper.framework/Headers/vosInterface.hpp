#ifndef VOSINTERFACE_HPP 
#define VOSINTERFACE_HPP

#include "vosInterface.h"
#include "vmPtr.h"

#if __cplusplus < 201103L && (!defined _MSC_VER || _MSC_VER < 1700)
#	error "This header is only supported in C++ 11 and later"
#endif

/*------------- V-OS C++ interface --------------*/
/*
*Call a VM function
*Params:
*-vaID: VA ID
*-functionID: function ID
*-args: actual arguments for VM function, all must be integer or vmPtr
*/
template <class ...Args>
static inline int call_vm_function_t(void* vmhandle, int vaID, int functionID, Args ...args) {
	struct arg_t{
		arg_t(unsigned int arg) : val(arg)
		{}
		arg_t(int arg) : val(arg)
		{}
		arg_t(vmPtr arg) : val(arg.addr_vm)
		{}

		const int val;
	};

	const size_t numArgs = sizeof...(args);
	arg_t args_t_arr[] = { args... };

	int args_arr[numArgs];

	for (size_t i = 0; i < numArgs; ++i) {
		args_arr[i] = args_t_arr[i].val;
	}

	return call_vm_function_a(vmhandle, vaID, functionID, numArgs, args_arr);
}

//zero argument verson
static inline int call_vm_function_t(void* vmhandle, int vaID, int functionID)
{
	return call_vm_function(vmhandle, vaID, functionID, 0);
}

#endif
