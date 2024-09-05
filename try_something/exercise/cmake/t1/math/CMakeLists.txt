aux_source_directory(. DIR_MATH_SRCS)

# compile the source files in the src directory into a static link library
add_library(MathFunctions ${DIR_MATH_SRCS})