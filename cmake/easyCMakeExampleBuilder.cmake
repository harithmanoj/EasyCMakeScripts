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

# Function to setup script for runnling all examples and write output to files.
function(easyCMake_setupExampleConfig)
    file(WRITE "${CMAKE_BINARY_DIR}/run_ex_gen.bat" "@echo off\necho Run examples with pipe out enabled, and divert output to files\n")
endfunction(easyCMake_setupExampleConfig)

# Function to create executable for each example.
# ExecutableCreated: {TARGET} if {USE_NAME_VERBATIM}, {MODULE}Ex_{TARGET} else.
# CompiledSources: {SRC}
# LinkedLibraries: {DEP}
# PreprocessorDefinitions:
#   EXAMPLE_NAME = {MODULE}Ex_{TARGET}
# Param:
#   TARGET              Name of executable in case {USE_NAME_VERBATIM} or part of it else, if not present uses the name of first source file.
#   MODULE              Module name for easy identification (use abbreviations).
#   SRC                 Source files for the executable.
#   DEP                 Dependancies of the executable.
#   CREATE_PIPE         Append target to script for running all examples and record output.
#   USE_NAME_VERBATIM   Use TARGET as the name of executable rathar than a mix of MODULE and TARGET.
function(easyCMake_configureExample)

    cmake_parse_arguments(
        PARSE_ARGV 0 
        "CONFIG_EX" 
        "CREATE_PIPE;USE_NAME_VERBATIM" 
        "MODULE;TARGET" 
        "SRC;DEP"
    )

    if(NOT DEFINED CONFIG_EX_TARGET)
        list(GET CONFIG_EX_SRC 0 CONFIG_EX_TARGET)
        get_filename_component(CONFIG_EX_TARGET ${CONFIG_EX_TARGET} NAME_WLE)
    endif(NOT DEFINED CONFIG_EX_TARGET)

    if(NOT DEFINED CONFIG_EX_MODULE)
        set(CONFIG_EX_MODULE "")
    endif(NOT DEFINED CONFIG_EX_MODULE)
    
    if(CONFIG_EX_CREATE_PIPE)
        message(STATUS "-    Piped Out Example for ${CONFIG_EX_MODULE}: ${CONFIG_EX_TARGET}")
    else()
        message(STATUS "-    Example for ${CONFIG_EX_MODULE}: ${CONFIG_EX_TARGET}")
    endif(CONFIG_EX_CREATE_PIPE)

    set(exampleName "${CONFIG_EX_MODULE}Ex_${CONFIG_EX_TARGET}")

    if(CONFIG_EX_USE_NAME_VERBATIM)
        set(builderTargetName "${CONFIG_EX_TARGET}")
    else()
        set(builderTargetName "${exampleName}")
    endif(CONFIG_EX_USE_NAME_VERBATIM)

    add_executable(${builderTargetName} ${CONFIG_EX_SRC})
    
    target_compile_definitions(${builderTargetName} PRIVATE EXAMPLE_NAME="${exampleName}")
    target_compile_definitions(${builderTargetName} PRIVATE EASY_CMAKE_SCRIPT_EXAMPLE)

    if(DEFINED CONFIG_EX_DEP)
        foreach(X ${CONFIG_EX_DEP})
            target_link_libraries(${builderTargetName} PUBLIC ${X}) 
            message(VERBOSE "        Example ${CONFIG_EX_MODULE}> ${CONFIG_EX_TARGET}: linking to ${X}")       
        endforeach(X ${CONFIG_EX_DEP})
    endif(DEFINED CONFIG_EX_DEP)

    if(CONFIG_EX_CREATE_PIPE)
        message(VERBOSE "        Example ${CONFIG_EX_MODULE}> ${CONFIG_EX_TARGET}: creating piped output\n")
        file(APPEND "${CMAKE_BINARY_DIR}/run_ex_gen.bat" "\necho ${CONFIG_EX_MODULE} : ${CONFIG_EX_TARGET}\n")
        file(APPEND "${CMAKE_BINARY_DIR}/run_ex_gen.bat" "$<TARGET_FILE:${builderTargetName}> > ${CMAKE_CURRENT_SOURCE_DIR}/${CONFIG_EX_TARGET}.out.txt\n")
    endif(CONFIG_EX_CREATE_PIPE)

endfunction(easyCMake_configureExample)

# Function to generate batch file to run all example targets and write output to file.
# Param:
#   target: Target to use for file, generate 
# Generates Script: ${CMAKE_BINARY_DIR}/Pipe/$<CONFIG>_run_ex.bat
# Input Script: ${CMAKE_BINARY_DIR}/run_ex_gen.bat
function(easyCMake_generatePipeOutScript target)
    file(
        GENERATE 
        OUTPUT
            ${CMAKE_BINARY_DIR}/Pipe/$<CONFIG>_run_ex.bat
        INPUT
            ${CMAKE_BINARY_DIR}/run_ex_gen.bat
        TARGET
            ${target}
    )
endfunction(easyCMake_generatePipeOutScript)

