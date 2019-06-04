project "GLFW"
    kind "StaticLib"
    language "C"
    cdialect "C11"
    staticruntime "on"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    filter "system:linux"
        files
        {
            "src/linux_joystick.c",

            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",

            "src/xkb_unicode.c",

            "src/posix_time.c",
            "src/posix_thread.c",

            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_X11"
		}
		
	filter "system:windows"
        files
        {
            "src/win32_joystick.c",

            "src/win32_init.c",
            "src/win32_monitor.c",
            "src/win32_window.c",

            "src/win32_time.c",
            "src/win32_thread.c",

            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
		}

		libdirs
		{
			"lib/"
		}

        defines
        {
			"_GLFW_USE_CONFIG_H"
		}
		
		links
		{
			"user32",
			"kernel32",
			"gdi32",
			"opengl32"
		}

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
		runtime "Release"
		optimize "on"