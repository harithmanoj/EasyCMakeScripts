# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 22 December 2024


message(STATUS "CMAKE Now at targetDefineVersion basic tests Configuration")

include(../../cmake/easyCMakeVersion.cmake)


function(createTest)
    
    set(single_val TARGET STD)
    set(multi_val SRC DEP)

    cmake_parse_arguments(PARSE_ARGV 0 "TEST" "" "${single_val}" "${multi_val}")

    add_executable(${TEST_TARGET} ${TEST_SRC})

    if(DEFINED TEST_STD)
        target_compile_features(${TEST_TARGET} PRIVATE ${TEST_STD})
    else()
        target_compile_features(${TEST_TARGET} PRIVATE cxx_std_20)
    endif(DEFINED TEST_STD)

    if(DEFINED TEST_DEP)
        foreach(X ${TEST_DEP})
            target_link_libraries(${TEST_TARGET} PUBLIC ${X})
        endforeach(X ${TEST_DEP})
    endif(DEFINED TEST_DEP)
    
    add_test(NAME ${TEST_TARGET}_test COMMAND ${TEST_TARGET})
    set_tests_properties(${TEST_TARGET}_test PROPERTIES FAIL_REGULAR_EXPRESSION "FAIL*")

endfunction(createTest)

createTest(
    TARGET versionDef
    SRC version.cpp
)

easyCMake_targetDefineVersion(
    TARGET versionDef
    MAJOR 1
    MINOR 0
    REVISION 1
    BUILD_CODE 1
    FULLSTRING "1.0.1.beta"
    NAME_PREFIX VERSION_TEST
    SCOPE PUBLIC
)

createTest(
    TARGET versionPartDef
    SRC version.cpp
)

target_compile_definitions(versionPartDef PUBLIC VERSION_TEST_IGNORE_REVISION)
target_compile_definitions(versionPartDef PUBLIC VERSION_TEST_IGNORE_FULLSTRING)

easyCMake_targetDefineVersion(
    TARGET versionPartDef
    MAJOR 1
    MINOR 0
    BUILD_CODE 1
    NAME_PREFIX VERSION_TEST
    SCOPE PUBLIC
)

createTest(
    TARGET versionGen
    SRC versionGen.cpp
)

easyCMake_generateVersionHeader(
    TARGETS versionGen
    SCOPE PRIVATE
    NAME easyCMake
    DESCRIPTION "Header for version test"
    NAMESPACE easy
    MAJOR 1
    MINOR 5
    REVISION 2
    BUILD_CODE RELEASE
    FULLSTRING "1.5.2.release"
)

createTest(
    TARGET versionGenCustomPath
    SRC versionGen2.cpp
)

easyCMake_generateVersionHeader(
    TARGETS versionGenCustomPath
    SCOPE PRIVATE
    NAME "Easy CMake Scripts tester"
    DESCRIPTION "EasyCMakeScripts Version generator test header"
    NAMESPACE easy
    MAJOR 1
    MINOR 5
    REVISION 2
    BUILD_CODE RELEASE
    FULLSTRING "1.5.2.release"
    OUT_NAME "version2.h"
    OUT_DIR easyCMake
)

