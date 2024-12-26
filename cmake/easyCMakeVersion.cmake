# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 18 December 2024

cmake_minimum_required(VERSION 3.17)

if(CMAKE_VERSION VERSION_LESS "3.5")
    include(CMakeParseArguments)
endif(CMAKE_VERSION VERSION_LESS "3.5")

# Function to set Major, Minor, Revision, build and full string as preprocessor definitions for a target.
# Example shown in parameters, to set 1.0.0.alpha for target foo as FOO_VERSION_MAJOR, .. etc
# Param:
#   TARGET      Name of target to set preprocessor definitions for (eg. foo).
#   MAJOR       Major version number, not defined if not passed. set as PREFIX_MAJOR (eg. 1).
#   MINOR       Minor version number, not defined if not passed. set as PREFIX_MINOR (eg. 0).
#   REVISION    Revision version number, not defined if not passed. set as PREFIX_REVISION (eg. 0).
#   BUILD_CODE  Build version type code, not defined if not passed. set as PREFIX_BUILD_CODE (eg. 0).
#   FULLSTRING  Full version as a string, not defined if not passed. set as PREFIX_FULLSTRING (eg. "1.0.0.alpha").
#   NAME_PREFIX Prefix to use for each definition (eg. FOO_VERSION).
#   SCOPE       scope of definitions, PUBLIC if not passed (eg. PUBLIC, PRIVATE, INTERFACE).
function(easyCMake_targetDefineVersion)

    cmake_parse_arguments(
        PARSE_ARGV 0 
        "EASY_CMAKE" 
        "" 
        "TARGET;MAJOR;MINOR;REVISION;BUILD_CODE;FULLSTRING;NAME_PREFIX;SCOPE" 
        ""
    )

    if(NOT DEFINED EASY_CMAKE_NAME_PREFIX)
        set(EASY_CMAKE_NAME_PREFIX ${EASY_CMAKE_TARGET})
    endif(NOT DEFINED EASY_CMAKE_NAME_PREFIX)

    if(NOT DEFINED EASY_CMAKE_SCOPE)
        set(EASY_CMAKE_SCOPE PUBLIC)
    endif(NOT DEFINED EASY_CMAKE_SCOPE)
    
    function(easyCMake_defineField field isStr)
        set(value "EASY_CMAKE_${field}")
        
        if(DEFINED ${value})
            message(VERBOSE "Defining ${field}")
            if(isStr)
                target_compile_definitions(${EASY_CMAKE_TARGET} ${EASY_CMAKE_SCOPE} ${EASY_CMAKE_NAME_PREFIX}_${field}="${${value}}")
            else()
                target_compile_definitions(${EASY_CMAKE_TARGET} ${EASY_CMAKE_SCOPE} ${EASY_CMAKE_NAME_PREFIX}_${field}=${${value}})
            endif(isStr)
        endif(DEFINED ${value})
    endfunction(easyCMake_defineField field)

    easyCMake_defineField(MAJOR OFF)
    easyCMake_defineField(MINOR OFF)
    easyCMake_defineField(REVISION OFF)
    easyCMake_defineField(BUILD_CODE OFF)
    easyCMake_defineField(FULLSTRING ON)

endfunction(easyCMake_targetDefineVersion)
