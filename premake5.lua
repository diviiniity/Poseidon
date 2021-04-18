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

include "Poseidon/vendor/GLFW"
include "Poseidon/vendor/Glad"
include "Poseidon/vendor/imgui"

project "Poseidon"
	location "Poseidon"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "pspch.h"
	pchsource "Poseidon/src/pspch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"PS_PLATFORM_WINDOWS",
			"PS_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines
		{
			"PS_DEBUG",
			"PS_ENABLE_ASSERTS"
		}
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
		buildoptions "/MD"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Poseidon/vendor/spdlog/include",
		"Poseidon/src"
	}

	links
	{
		"Poseidon"
	}

	postbuildcommands
	{
		"xcopy /y $(SolutionDir)bin\\" .. outputdir .. "\\Poseidon\\Poseidon.dll $(SolutionDir)bin\\" .. outputdir .. "\\Sandbox"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
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
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
		buildoptions "/MD"
		optimize "On"