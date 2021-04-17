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
		"%{prj.name}/vendor/spdloglib/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"PS_PLATFORM_WINDOWS",
			"PS_BUILD_DLL"
		}


	filter "configurations:Debug"
		defines "PS_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
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
		"Poseidon/vendor/spdloglib/include",
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
		defines "PS_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
		optimize "On" 