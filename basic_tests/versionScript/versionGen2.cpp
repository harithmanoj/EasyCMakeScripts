/**
 * @file versionGen.cpp 
 * @author Harith Manoj
 * @brief generate version header test.
 * @date 01 January 2025
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

#include <easyCMake/version2.h>

int main()
{

    std::cout << easy::meta::versionString << '\n'
        << easy::meta::versionMajor << '\n'
        << easy::meta::versionMinor << '\n'
        << easy::meta::versionRevision << '\n'
        << easy::meta::versionBuild << '\n';

    std::cout << "PASS\n";
}