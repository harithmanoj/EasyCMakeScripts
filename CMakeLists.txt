# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0


cmake_minimum_required(VERSION 3.10)

set(EASY_CMAKE_SCRIPTS_VERSION_MAJOR 1)
set(EASY_CMAKE_SCRIPTS_VERSION_MINOR 0)
set(EASY_CMAKE_SCRIPTS_VERSION_REVISION 1)
set(EASY_CMAKE_SCRIPTS_VERSION ${EASY_CMAKE_SCRIPTS_VERSION_MAJOR}.${EASY_CMAKE_SCRIPTS_VERSION_MINOR}.${EASY_CMAKE_SCRIPTS_VERSION_REVISION})

project(EasyCMakeScripts VERSION ${EASY_CMAKE_SCRIPTS_VERSION} DESCRIPTION "Collection of usefull CMake scripts with various functions")


message(STATUS "CMAKE Now at EasyCMakeScripts version: ${EASY_CMAKE_SCRIPTS_VERSION}")

