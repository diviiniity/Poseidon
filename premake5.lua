workspace "Poseidon"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Poseidon/vendor/GLFW/include"
IncludeDir["Glad"] = "Poseidon/vendor/Glad/include"
IncludeDir["ImGui"] = "Poseidon/vendor/imgui"
IncludeDir["glm"] = "Poseidon/vendor/glm"

group "Dependencies"
	include "Poseidon/vendor/GLFW"
	include "Poseidon/vendor/Glad"
	include "Poseidon/vendor/imgui"

group ""

project "Poseidon"
	location "Poseidon"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "pspch.h"
	pchsource "Poseidon/src/pspch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"PS_PLATFORM_WINDOWS",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines
		{
			"PS_DEBUG",
			"PS_ENABLE_ASSERTS"
		}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "PS_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "PS_DIST"
		runtime "Release"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"Poseidon/vendor/spdlog/include",
		"Poseidon/src",
		"Poseidon/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Poseidon"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"PS_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines
		{
			"PS_DEBUG",
			"PS_ENABLE_ASSERTS"
		}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "PS_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "PS_DIST"
		runtime "Release"
		optimize "on"