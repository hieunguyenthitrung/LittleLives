//
//  ReadFile.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import Foundation


class ReadFile: NSObject {
    static func readLocalFile(forName name: String) -> [UserEvent]? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let anyObj = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                let result = Result(JSON: anyObj as! [String : AnyObject])
                let events = result?.data?.userTimeline
                return  events
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
