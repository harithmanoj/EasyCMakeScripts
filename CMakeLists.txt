# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 18 December 2024


cmake_minimum_required(VERSION 3.21)

set(EASY_CMAKE_SCRIPTS_VERSION_MAJOR 1)
set(EASY_CMAKE_SCRIPTS_VERSION_MINOR 0)
set(EASY_CMAKE_SCRIPTS_VERSION_REVISION 1)
set(EASY_CMAKE_SCRIPTS_VERSION ${EASY_CMAKE_SCRIPTS_VERSION_MAJOR}.${EASY_CMAKE_SCRIPTS_VERSION_MINOR}.${EASY_CMAKE_SCRIPTS_VERSION_REVISION})
set(EASY_CMAKE_SCRIPTS_RELEASE_TYPE "release")

option(EASY_CMAKE_SCRIPTS_DEVELOPMENT_BUILD "Build tests, enable warnings, etc" OFF)
option(EASY_CMAKE_SCRIPTS_INSTALL_DOCS "Install Documentation files also" ON)

include(CMakeDependentOption)

cmake_dependent_option(EASY_CMAKE_SCRIPTS_BUILD_BASIC_TEST "Should Build tests along with library" ON EASY_CMAKE_SCRIPTS_DEVELOPMENT_BUILD OFF)
cmake_dependent_option(EASY_CMAKE_SCRIPTS_PREPARE_RELEASE "Prepare compressed release files after build" OFF EASY_CMAKE_SCRIPTS_DEVELOPMENT_BUILD OFF)

project(EasyCMakeScripts VERSION ${EASY_CMAKE_SCRIPTS_VERSION} DESCRIPTION "Collection of usefull CMake scripts with various functions")


message(STATUS "CMAKE Now at EasyCMakeScripts version: ${EASY_CMAKE_SCRIPTS_VERSION}")

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    message(STATUS "    Configuring STANDALONE for EasyCMakeScripts")  

    if(EASY_CMAKE_SCRIPTS_BUILD_BASIC_TEST)
        enable_testing()
    endif(EASY_CMAKE_SCRIPTS_BUILD_BASIC_TEST)

    set(EASY_CMAKE_SCRIPTS_STANDALONE_BUILD ON)

else()

    set(EASY_CMAKE_SCRIPTS_STANDALONE_BUILD OFF)

endif(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)


if(EASY_CMAKE_SCRIPTS_BUILD_BASIC_TEST)
    add_subdirectory(basic_tests)
endif(EASY_CMAKE_SCRIPTS_BUILD_BASIC_TEST)

if(EASY_CMAKE_SCRIPTS_STANDALONE_BUILD)
    include(cmake/installConfig.cmake)
endif(EASY_CMAKE_SCRIPTS_STANDALONE_BUILD)

if(EASY_CMAKE_SCRIPTS_PREPARE_RELEASE)
    configure_file(res/compressRelease.py.in compressRelease.py)
endif(EASY_CMAKE_SCRIPTS_PREPARE_RELEASE)
