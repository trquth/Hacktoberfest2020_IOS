//
//  File.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/12/2020.
//

import Foundation

class Util {
    static func initData()-> [Section] {
        let s = try! String(contentsOfFile: Bundle.main.path(forResource: "states", ofType: "txt")!)
        let states = s.components(separatedBy: "\n")
        let d = Dictionary(grouping: states){
            String($0.prefix(1))
        }
        return Array(d).sorted {$0.key < $1.key}.map{ Section(sectionName: $0.key, rowData: $0.value)}
    }
}
