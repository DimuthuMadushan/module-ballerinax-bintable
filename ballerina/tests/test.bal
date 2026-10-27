// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.bintable.com/v1" : "http://localhost:9090";
final string apiKey = isLiveServer ? os:getEnv("BINTABLE_API_KEY") : "test_api_key";

final Client bintable = check new ({apiKey}, serviceUrl = serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testLookupBin() returns error? {
    ResponseItem[] response = check bintable->lookupBin("457173");
    test:assertTrue(response.length() > 0);
    test:assertEquals(response[0].result, 200);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetBalance() returns error? {
    ResponseItem[] response = check bintable->getBalance();
    test:assertTrue(response.length() > 0);
    test:assertEquals(response[0].message, "SUCCESS");
}
