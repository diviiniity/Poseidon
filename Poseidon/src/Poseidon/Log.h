#pragma once

#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"

namespace Poseidon{
	class POSEIDON_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log macros
#define PS_CORE_TRACE(...) ::Poseidon::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define PS_CORE_INFO(...)  ::Poseidon::Log::GetCoreLogger()->info(__VA_ARGS__)
#define PS_CORE_WARN(...)  ::Poseidon::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define PS_CORE_ERROR(...) ::Poseidon::Log::GetCoreLogger()->error(__VA_ARGS__)
#define PS_CORE_CRITICAL(...) ::Poseidon::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client Log macros
#define PS_TRACE(...)	   ::Poseidon::Log::GetClientLogger()->trace(__VA_ARGS__)
#define PS_INFO(...)	   ::Poseidon::Log::GetClientLogger()->info(__VA_ARGS__)
#define PS_WARN(...)	   ::Poseidon::Log::GetClientLogger()->warn(__VA_ARGS__)
#define PS_ERROR(...)	   ::Poseidon::Log::GetClientLogger()->error(__VA_ARGS__)
#define PS_CRITICAL(...)	   ::Poseidon::Log::GetClientLogger()->critical(__VA_ARGS__)

