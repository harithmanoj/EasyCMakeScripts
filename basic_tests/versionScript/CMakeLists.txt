# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 22 December 2024


message(STATUS "CMAKE Now at targetDefineVersion basic tests Configuration")

include(../../cmake/easyCMakeVersion.cmake)


function(createTest)
    
    set(single_val TARGET)
    set(multi_val SRC DEP)

    cmake_parse_arguments(PARSE_ARGV 0 "TEST" "" "${single_val}" "${multi_val}")

    add_executable(${TEST_TARGET} ${TEST_SRC})

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

