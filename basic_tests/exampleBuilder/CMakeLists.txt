# Part of Project EasyCMakeScripts
# Copyright (C) Harith Manoj
# Licensed under Apache License, Version 2.0
# See http://www.apache.org/licenses/LICENSE-2.0    
# for copy of license or attached LICENSE text file.
# Date: 22 December 2024

message(STATUS "CMAKE Now at ConfigureExample basic tests Configuration")

include(../../cmake/easyCMakeExampleBuilder.cmake)

function(createExampleAndCheck)
        
    set(option CREATE_PIPE USE_NAME_VERBATIM)
    set(single MODULE TARGET)
    set(multi SRC DEP)

    cmake_parse_arguments(PARSE_ARGV 0 "CONFIG_EX" "${option}" "${single}" "${multi}")

    set(arg "")
    
    if(CONFIG_EX_CREATE_PIPE)
        list(APPEND arg "CREATE_PIPE")
    endif(CONFIG_EX_CREATE_PIPE)
    
    if(CONFIG_EX_USE_NAME_VERBATIM)
        list(APPEND arg "USE_NAME_VERBATIM")
    endif(CONFIG_EX_USE_NAME_VERBATIM)

    if(DEFINED CONFIG_EX_TARGET)
        list(APPEND arg "TARGET")
        list(APPEND arg "${CONFIG_EX_TARGET}")
    endif(DEFINED CONFIG_EX_TARGET)

    if(DEFINED CONFIG_EX_MODULE)
        list(APPEND arg "MODULE")
        list(APPEND arg "${CONFIG_EX_MODULE}")
    endif(DEFINED CONFIG_EX_MODULE)

    if(DEFINED CONFIG_EX_DEP)
        list(APPEND arg "DEP")
        foreach(X ${CONFIG_EX_DEP})
            list(APPEND arg "${X}")
        endforeach(X ${CONFIG_EX_DEP})
    endif(DEFINED CONFIG_EX_DEP)

    list(APPEND arg "SRC")

    foreach(X ${CONFIG_EX_SRC})
        list(APPEND arg "${X}")
    endforeach(X ${CONFIG_EX_SRC})

    easyCMake_configureExample(${arg})

    if(NOT DEFINED CONFIG_EX_TARGET)
        set(CONFIG_EX_TARGET "")
        list(GET CONFIG_EX_SRC 0 CONFIG_EX_TARGET)
        get_filename_component(CONFIG_EX_TARGET ${CONFIG_EX_TARGET} NAME_WLE)
    endif(NOT DEFINED CONFIG_EX_TARGET)
    
    if(CONFIG_EX_USE_NAME_VERBATIM)
        set(executable "${CONFIG_EX_TARGET}")      
    else()
        if(DEFINED CONFIG_EX_MODULE)
            set(executable "${CONFIG_EX_MODULE}Ex_${CONFIG_EX_TARGET}")
        else()
            set(executable "Ex_${CONFIG_EX_TARGET}")
        endif(DEFINED CONFIG_EX_MODULE)      
    endif(CONFIG_EX_USE_NAME_VERBATIM)

    add_test(NAME ${executable}_test COMMAND ${executable})

    if(DEFINED CONFIG_EX_MODULE)
        set_tests_properties(
            ${executable}_test 
            PROPERTIES PASS_REGULAR_EXPRESSION 
            "PASS ${CONFIG_EX_MODULE}Ex_${CONFIG_EX_TARGET}"
        )
    else()
        set_tests_properties(
            ${executable}_test 
            PROPERTIES PASS_REGULAR_EXPRESSION 
            "PASS Ex_${CONFIG_EX_TARGET}"
        )
    endif(DEFINED CONFIG_EX_MODULE)
    

endfunction(createExampleAndCheck)

easyCMake_setupExampleConfig()

createExampleAndCheck(
    MODULE "exTest"
    TARGET "example"
    SRC "example.cpp"
)

createExampleAndCheck(
    TARGET "exampleNoModule"
    SRC "exampleNoModule.cpp"
)

createExampleAndCheck(
    MODULE "exTest"
    SRC "exampleNoTarget.cpp"
)

createExampleAndCheck(
    MODULE "exTest"
    TARGET "example"
    SRC "example.cpp"
    USE_NAME_VERBATIM
)

createExampleAndCheck(
    MODULE "exTest"
    SRC "examplePiped.cpp"
    CREATE_PIPE
)

easyCMake_generatePipeOutScript(exTestEx_example)
