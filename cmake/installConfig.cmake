# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 26 December 2024

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

install(
    FILES 
        "cmake/easyCMakeExampleBuilder.cmake" 
        "cmake/easyCMakeVersion.cmake"
        "cmake/version.h.in"
    DESTINATION 
        ${CMAKE_INSTALL_LIBDIR}/cmake/easyCMakeScripts
)


configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/easyCMakeScriptsConfig.cmake"
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/easyCMakeScripts
)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/easyCMakeScriptsConfigVersion.cmake"
  VERSION "${EASY_CMAKE_SCRIPTS_VERSION}"
  COMPATIBILITY AnyNewerVersion
)

install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/easyCMakeScriptsConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/easyCMakeScriptsConfigVersion.cmake"
    DESTINATION 
        ${CMAKE_INSTALL_LIBDIR}/cmake/easyCMakeScripts
)

install(
    FILES
        "LICENSE"
    DESTINATION 
        ${CMAKE_INSTALL_LIBDIR}/cmake/easyCMakeScripts
)

if(EASY_CMAKE_SCRIPTS_INSTALL_DOCS)
    install(
        FILES
            "README.md"
        DESTINATION 
            ${CMAKE_INSTALL_LIBDIR}/cmake/easyCMakeScripts
    )
endif(EASY_CMAKE_SCRIPTS_INSTALL_DOCS)

