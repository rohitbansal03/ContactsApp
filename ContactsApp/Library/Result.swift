//
//  Result.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 01/10/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

struct Result<T> {
    let value: T

    func map<U>(f: T -> U) -> U {
        return f(value)
    }
}