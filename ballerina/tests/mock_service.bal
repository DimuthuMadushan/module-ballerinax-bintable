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

import ballerina/http;

listener http:Listener ep0 = new (9090);

@http:ServiceConfig {treatNilableAsOptional: true}
service / on ep0 {
    # Lookup for bin
    #
    # + bin - pass the required BIN code
    # + return - returns can be any of following types 
    # http:Ok (BIN data response)
    # http:Unauthorized (Your balance is exhausted,or package expired)
    # http:Forbidden (Invalid API Key)
    # http:UnprocessableEntity (API key is missing)
    resource function get [string bin]() returns ResponseItem[]|http:Unauthorized|http:Forbidden|http:UnprocessableEntity {
        return [
            {
                result: 200,
                message: "SUCCESS",
                data: {
                    "bin": bin,
                    "brand": "VISA",
                    "type": "CREDIT",
                    "category": "CLASSIC",
                    "issuer": "JPMORGAN CHASE BANK N.A.",
                    "country": {"alpha2": "US", "name": "United States"}
                }
            }
        ];
    }

    # Check Balance
    #
    # + return - returns can be any of following types 
    # http:Ok (Balance reponse)
    # http:Unauthorized (Your balance is exhausted,or package expired)
    # http:Forbidden (Invalid API Key)
    # http:UnprocessableEntity (API key is missing)
    resource function get balance() returns ResponseItem[]|http:Unauthorized|http:Forbidden|http:UnprocessableEntity {
        return [
            {
                result: 200,
                message: "SUCCESS",
                data: {
                    "balance": 4850,
                    "expiry": "2027-12-31"
                }
            }
        ];
    }
}
