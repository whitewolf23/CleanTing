//
//  b.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//

struct MappingError: Error, CustomStringConvertible {
    
    let description: String
    
    init(from: Any?, to: Any.Type) {
        self.description = "Failed to map \(from) to \(to)"
    }
    
}
