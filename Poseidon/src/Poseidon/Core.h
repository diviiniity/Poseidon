#pragma once


#ifdef PS_PLATFORM_WINDOWS
#if PS_DYNAMIC_LINK
	#ifdef PS_BUILD_DLL
		#define POSEIDON_API __declspec(dllexport)
	#else
		#define POSEIDON_API __declspec(dllimport)
	#endif
#else
	#define POSEIDON_API
#endif
#else
	#error Poseidon only supports Windows
#endif

#ifdef PS_ENABLE_ASSERTS
	#define PS_ASSERT(x, ...) { if(!(x)) { PS_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
	#define PS_CORE_ASSERT(x, ...) { if(!(x)) { PS_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
#else
	#define PS_ASSERT(x, ...)
	#define PS_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define PS_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)