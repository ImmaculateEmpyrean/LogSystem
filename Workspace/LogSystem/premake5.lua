project "LogSystem"
    location ""
    kind "StaticLib"
    language "C++"
    cppdialect "c++17"
    staticruntime "on"

    targetdir ("../bin/"..outputdir.."/%{prj.name}")
    objdir ("../bin-int/"..outputdir.."/%{prj.name}")

    files{
        "src/**.h",
        "src/**.cpp",
        "SpdLog/include/spdlog/**.h",
    }

    includedirs { 
        "src",
        "SpdLog/include",
    }

	filter "configurations:Debug"
		defines "ER_DEBUG_SHIP"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "ER_RELEASE_SHIP"
		runtime "Release"
		optimize "on"

