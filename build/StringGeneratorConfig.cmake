# defines the following:
# STRINGGENERATOR_INCLUDE_DIRS
# STRINGGENERATOR_LIBRARIES
# STRINGGENERATOR_EXECUTABLE

get_filename_component(STRINGGENERATOR_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set (STRINGGENERATOR_INCLUDE_DIRS "/home/samarth/Documents/sandbox/cmake_install;/home/samarth/Documents/sandbox/cmake_install/build")

if (NOT TARGET stringadder AND NOT StringGenerator_BINARY_DIR)
  include ("${STRINGGENERATOR_CMAKE_DIR}/StringGeneratorTargets.cmake")
endif()

set (STRINGGENERATOR_LIBRARIES stringadder)
set (STRINGGENERATOR_EXECUTABLE generate_string)
