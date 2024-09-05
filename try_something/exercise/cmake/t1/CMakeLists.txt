cmake_minimum_required (VERSION 3.10)

project(hello VERSION 1.0)

#check if system support pow() function
include (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
check_function_exist (pow HAVE_POW)

# add a configure header, to process cmake settings toward source code
configure_file(
    "${PROJECT_SOURCE_DIR}/config.h.in"
    "${PROJECT_BINARY_DIR}/config.h"
)

#define weather to use our self-define mathfunction library
option(
    USE_MYMATH
    "Use provided math implementtation" ON
)

# weather to add mathfunctions library
if (USE_MYMATH)
    include_directories("${PROJECT_SOURCE_DIR}/math")
    add_subdirectory(math)
    set(EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif(USE_MYMATH)

aux_source_directory(. DIR_SRCS)
add_executable(hello main.cpp)

# add_subdirectory(math) #add sublibraries so that CMakeLists.txt in sublibrarities can also be processed

target_link_libraries(hello ${EXTRA_LIBS})#tell cmake that main should have to link a library named MathFunctions