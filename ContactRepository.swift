//
//  ContactRepository.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 30/09/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

struct ContactRepository<T: DataSourceProtocol where T.ItemType == Contact>: ContactRepositoryProtocol {
    let datasource: T

    func add(contact: Contact) -> Contact { return datasource.add(contact) }
    func getAll() -> Result<[Contact]> { return datasource.getAll() }
    func get(index: Int) -> Result<Contact> { return datasource.get(index) }
}