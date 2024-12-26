/**
 * @file version.cpp 
 * @author Harith Manoj
 * @brief Test cmake script to check version preprocessor definition.
 * @date 19 December 2024
 * 
 * @copyright Copyright (C) Harith Manoj
 * 
 * 
 *                      APACHE LICENSE 2.0
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */


#include <iostream>

int main()
{


#if defined(VERSION_TEST_MAJOR) && !defined(VERSION_TEST_IGNORE_MAJOR)
    std::cout << "PASS: MAJOR " << VERSION_TEST_MAJOR << "\n";
#elif !defined(VERSION_TEST_MAJOR) && defined(VERSION_TEST_IGNORE_MAJOR)
    std::cout << "PASS: MAJOR\n";
#else
    std::cout << "FAIL: MAJOR\n";
#endif

#if defined(VERSION_TEST_MINOR) && !defined(VERSION_TEST_IGNORE_MINOR)
    std::cout << "PASS: MINOR " << VERSION_TEST_MINOR << "\n";
#elif !defined(VERSION_TEST_MINOR) && defined(VERSION_TEST_IGNORE_MINOR)
    std::cout << "PASS: MINOR\n";
#else
    std::cout << "FAIL: MINOR\n";
#endif

#if defined(VERSION_TEST_REVISION) && !defined(VERSION_TEST_IGNORE_REVISION)
    std::cout << "PASS: REVISION " << VERSION_TEST_REVISION << "\n";
#elif !defined(VERSION_TEST_REVISION) && defined(VERSION_TEST_IGNORE_REVISION)
    std::cout << "PASS: REVISION\n";
#else
    std::cout << "FAIL: REVISION\n";
#endif

#if defined(VERSION_TEST_BUILD_CODE) && !defined(VERSION_TEST_IGNORE_BUILD_CODE)
    std::cout << "PASS: BUILD_CODE " << VERSION_TEST_BUILD_CODE << "\n";
#elif !defined(VERSION_TEST_BUILD_CODE) && defined(VERSION_TEST_IGNORE_BUILD_CODE)
    std::cout << "PASS: BUILD_CODE\n";
#else
    std::cout << "FAIL: BUILD_CODE\n";
#endif

#if defined(VERSION_TEST_FULLSTRING) && !defined(VERSION_TEST_IGNORE_FULLSTRING)
    std::cout << "PASS: FULLSTRING " << VERSION_TEST_FULLSTRING << "\n";
#elif !defined(VERSION_TEST_FULLSTRING) && defined(VERSION_TEST_IGNORE_FULLSTRING)
    std::cout << "PASS: FULLSTRING\n";
#else
    std::cout << "FAIL: FULLSTRING\n";
#endif


}

