cmake_minimum_required (VERSION 3.0)
project (StringGenerator)

set (INSTALL_LIB_DIR lib)
set (INSTALL_BIN_DIR bin)
set (INSTALL_INCLUDE_DIR include)
set (INSTALL_CMAKE_DIR lib/CMake/${PROJECT_NAME})

# relative -> absolute paths
foreach (p LIB BIN INCLUDE CMAKE)
  set (var INSTALL_${p}_DIR)
  if (NOT IS_ABSOLUTE "${${var}}")
    set (${var} "${CMAKE_INSTALL_PREFIX}/${${var}}")
  endif()
endforeach()

add_library (stringadder SHARED
  src/StringAdder.h
  src/StringAdder.cpp)
set_target_properties (stringadder PROPERTIES
  PUBLIC_HEADER "src/StringAdder.h")
install (TARGETS stringadder
  EXPORT StringGeneratorTargets
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin
  LIBRARY DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
  PUBLIC_HEADER DESTINATION "${INSTALL_INCLUDE_DIR}/stringadder" COMPONENT dev)

add_executable (generate_string
  src/StringGenerator.cpp)
target_link_libraries (generate_string stringadder)
install (TARGETS generate_string
  EXPORT StringGeneratorTargets
  RUNTIME DESTINATION "${INSTALL_BIN_DIR}" COMPONENT bin)

file(RELATIVE_PATH REL_INCLUDE_DIR "${INSTALL_CMAKE_DIR}" "${INSTALL_INCLUDE_DIR}")

#configure for build tree
set(CONF_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}" "${PROJECT_BINARY_DIR}")
configure_file(StringGeneratorConfig.cmake.in "${PROJECT_BINARY_DIR}/StringGeneratorConfig.cmake" @ONLY)

# configure for install tree
set(CONF_INCLUDE_DIRS "\${STRINGGENERATOR_CMAKE_DIR}/${REL_INCLUDE_DIR}")
configure_file(StringGeneratorConfig.cmake.in "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/StringGeneratorConfig.cmake" @ONLY)

install(FILES
  "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/StringGeneratorConfig.cmake"
  DESTINATION "${INSTALL_CMAKE_DIR}" COMPONENT dev)

install(EXPORT StringGeneratorTargets DESTINATION
  "${INSTALL_CMAKE_DIR}" COMPONENT dev)
