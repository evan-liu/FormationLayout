/**
 *  FormationLayout
 *
 *  Copyright (c) 2016 Evan Liu. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation

extension String {
    func search(regExp pattern: String, options: NSRegularExpression.Options = []) -> [String]? {
        let ns = self as NSString
        return (try? NSRegularExpression(pattern: pattern, options: options))
            .flatMap { $0.firstMatch(in: self, options: [], range: NSRange(location: 0, length: utf16.count)) }
            .flatMap { match in
                return (0..<match.numberOfRanges).map { ns.substring(with: match.rangeAt($0)) }
            }
    }
}

@available (OSX 10.11, *)
func main() {
    
    let fileManager = FileManager.default
    
    let pwdURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
    let scriptURL = URL(fileURLWithPath: #file, relativeTo: pwdURL)
    let sourcesURL = scriptURL.deletingLastPathComponent().deletingLastPathComponent().appendingPathComponent("Sources")
    let codeFileURL = sourcesURL.appendingPathComponent("ConstraintMaker+Anchors.swift")
    let code = try! String(contentsOf: codeFileURL)
    
    guard let match = code.search(regExp: "(.*?)(extension ConstraintMaker \\{.*?^\\})", options: [.dotMatchesLineSeparators, .anchorsMatchLines]) else {
        print("Wrong code format")
        return
    }

    let header = match[1]
    let seedCode = match[2]
    guard let seedAnchor = seedCode.search(regExp: "func (.*?)\\(")?.last else {
        print("Wrong code format")
        return
    }
    
    let anchors = [
        "left",
        "right",
        "top",
        "bottom",
        "leading",
        "trailing",
        "width",
        "height",
        "centerX",
        "centerY",
        "lastBaseline",
        "firstBaseline",
        "centerXWithinMargins", 
        "centerYWithinMargins",
    ]
    let equals = anchors
        .map { seedCode.replacingOccurrences(of: seedAnchor, with: $0) }
        .joined(separator: "\n\n")
    
    let relations = ["greaterThanOrEqualTo", "lessThanOrEqualTo"]
        .map { equals.replacingOccurrences(of: "equalTo", with: $0) }
    
    let finalCode = header + ([equals] + relations).joined(separator: "\n\n")
    
    do {
        try finalCode.write(to: codeFileURL, atomically: true, encoding: .utf8)
        print("Done")
    } catch {
        print(error)
    }
}

if #available(OSX 10.11, *) {
    main()
} else {
    print("Only available on OS X 10.11 or newer")
    exit(1)
}