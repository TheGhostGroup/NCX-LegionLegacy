# Set build-directive (used in core to tell which buildtype we used)
add_definitions(-D_BUILD_DIRECTIVE='"${CMAKE_BUILD_TYPE}"')

add_definitions(-fno-delete-null-pointer-checks)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
message(STATUS "GCC: Enabled c++11 support")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
message(STATUS "GCC: Enabled C99 support")

if(PLATFORM EQUAL 32)
  # Required on 32-bit systems to enable SSE2 (standard on x64)
  add_definitions(-msse2 -mfpmath=sse)
endif()
add_definitions(-DHAVE_SSE2 -D__SSE2__)
message(STATUS "GCC: SSE2 flags forced")

if( WITH_WARNINGS )
  add_definitions(-Wall -Wfatal-errors -Wextra)
  message(STATUS "GCC: All warnings enabled")
else()
  add_definitions(--no-warnings)
  message(STATUS "GCC: All warnings disabled")
endif()

if( WITH_COREDEBUG )
  add_definitions(-ggdb3)
  message(STATUS "GCC: Debug-flags set (-ggdb3)")
endif()
