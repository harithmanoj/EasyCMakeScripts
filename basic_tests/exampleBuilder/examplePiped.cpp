/**
 * @file examplePiped.cpp 
 * @author Harith Manoj
 * @brief Example builder documentation.
 * @date 23 December 2024
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
#ifdef EASY_CMAKE_SCRIPT_EXAMPLE
    std::cout << "PASS ";
#else
    std::cout << "FAIL ";
#endif

#ifdef EXAMPLE_NAME
    std::cout << EXAMPLE_NAME;
#else
    std::cout << "FAIL";
#endif
}
