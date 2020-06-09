project "LogSystem"
    location ""
    kind "StaticLib"
    language "C++"
    cppdialect "c++17"
    staticruntime "off"

    targetdir ("../bin/"..outputdir.."/%{prj.name}")
    objdir ("../bin-int/"..outputdir.."/%{prj.name}")

    files{
        "src/**.h",
        "src/**.cpp",
        "SpdLog/include/spdlog/**.h"
    }

    includedirs { 
        "src",
        "SpdLog/include/"
    }

filter "configurations:Debug_Development"
    runtime "Debug"
	symbols "on"
    
filter "configurations:Release_Distribution"
    runtime "Release"
    optimize "on"
