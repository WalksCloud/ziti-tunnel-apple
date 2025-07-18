//
// Copyright 2019-2020 NetFoundry, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

class Version {
    static var appVersion:String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown version"
    }
    
    static var appBuild:String? {
        if let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return "(\(appBuild))"
        }
        return nil
    }
    
    static var osVersion:String {
        return ProcessInfo.processInfo.operatingSystemVersionString
    }
    
    static var str:String {
        var appVersion = Version.appVersion
        if let appBuild  = Version.appBuild {
            appVersion += " \(appBuild)"
        }
        return appVersion
    }
    
    static var verboseStr:String {
        return "\(Bundle.main.bundleIdentifier ?? "Z-Gate Agent") Version: \(Version.str), OS: \(osVersion)"
    }
}
