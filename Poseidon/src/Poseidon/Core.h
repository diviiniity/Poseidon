#pragma once


#ifdef PS_PLATFORM_WINDOWS
	#ifdef PS_BUILD_DLL
		#define POSEIDON_API __declspec(dllexport)
	#else
		#define POSEIDON_API __declspec(dllimport)
	#endif
#else
	#error Poseidon only supports Windows
#endif

#define BIT(x) (1 << x)