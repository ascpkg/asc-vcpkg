set(CMAKE_C_COMPILER D:/__develop__/FutureOrientedGB/asc/target/zig-windows-x86_64-0.13.0/zig.exe cc)
set(CMAKE_CXX_COMPILER D:/__develop__/FutureOrientedGB/asc/target/zig-windows-x86_64-0.13.0/zig.exe c++)
set(CMAKE_AR D:/__develop__/FutureOrientedGB/asc/target/zig-windows-x86_64-0.13.0/zig.exe ar)
set(CMAKE_RANLIB D:/__develop__/FutureOrientedGB/asc/target/zig-windows-x86_64-0.13.0/zig.exe ranlib)

# Common flags
set(CMAKE_C_FLAGS_INIT "")
set(CMAKE_CXX_FLAGS_INIT "")

# Handle target architecture
if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
    set(ZIG_TARGET_ARCH "x86_64")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
    set(ZIG_TARGET_ARCH "i386")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    set(ZIG_TARGET_ARCH "arm")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
    set(ZIG_TARGET_ARCH "aarch64")
else()
    message(FATAL_ERROR "Unsupported architecture for Zig: ${VCPKG_TARGET_ARCHITECTURE}")
endif()

# Handle target system
if(VCPKG_TARGET_IS_WINDOWS OR CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    set(ZIG_TARGET_SYS "windows-gnu")
elseif(VCPKG_TARGET_IS_LINUX OR CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set(ZIG_TARGET_SYS "linux-gnu")
elseif(VCPKG_TARGET_IS_OSX OR CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin")
    set(ZIG_TARGET_SYS "macos")
elseif(VCPKG_TARGET_IS_ANDROID OR VCPKG_CMAKE_SYSTEM_NAME STREQUAL "Android")
    set(ZIG_TARGET_SYS "android")
else()
    message(FATAL_ERROR "Unsupported system for Zig: ${CMAKE_SYSTEM_NAME}")
endif()

# Set target
if(VCPKG_TARGET_IS_LINUX OR CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set(ZIG_TARGET "${ZIG_TARGET_ARCH}-${ZIG_TARGET_SYS}.2.17")
else()
    set(ZIG_TARGET "${ZIG_TARGET_ARCH}-${ZIG_TARGET_SYS}")
endif()
set(TARGET_PARAMETER "-target ${ZIG_TARGET}")

# Add target to compiler flags
set(CMAKE_C_COMPILER_TARGET ${ZIG_TARGET})
set(CMAKE_CXX_COMPILER_TARGET ${ZIG_TARGET})

# Add target to compiler and linker flags
set(CMAKE_C_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} ${TARGET_PARAMETER}")
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} ${TARGET_PARAMETER}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT} ${TARGET_PARAMETER}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_SHARED_LINKER_FLAGS_INIT} ${TARGET_PARAMETER}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS_INIT} ${TARGET_PARAMETER}")

set(CMAKE_CROSSCOMPILING TRUE)