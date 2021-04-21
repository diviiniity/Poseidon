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
	kind "SharedLib"
	language "C++"
	staticruntime "off"

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

	postbuildcommands
	{
		"xcopy /y $(SolutionDir)bin\\" .. outputdir .. "\\Poseidon\\Poseidon.dll $(SolutionDir)bin\\" .. outputdir .. "\\Sandbox\\"
	}

	filter "system:windows"
		cppdialect "C++17"
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
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
		runtime "Release"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"

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
		"Poseidon/src",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Poseidon"
	}

	filter "system:windows"
		cppdialect "C++17"
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
		symbols "On"

	filter "configurations:Release"
		defines "PS_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "PS_DIST"
		runtime "Release"
		optimize "On"