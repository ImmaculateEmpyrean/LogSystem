workspace "LogSystemSandbox"
	architecture "x86_64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" -- This is a string object ..

include "LogSystem"

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
		"Sandbox/src/**.h",
		"Sandbox/src/**.cpp"
	}

	includedirs
	{
		"Sandbox/src",
		"LogSystem/src",
		"LogSystem/SpdLog/include"
	}
	
	links
	{
		"LogSystem"
	}

	filter "configurations:Debug"
		defines "ER_DEBUG_SHIP"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "ER_RELEASE_SHIP"
		runtime "Release"
		optimize "on"

