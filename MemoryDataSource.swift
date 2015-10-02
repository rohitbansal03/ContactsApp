//
//  MemoryDataSource.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 30/09/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

class MemoryDataSource<T>: DataSourceProtocol {
    var items: [T] = []
    func add(item: T) -> T { items.append(item); return item }
    func getAll() -> Result<[T]> { return Result(value: items) }
    func get(index: Int) -> Result<T> { return Result(value: items[index]) }
}