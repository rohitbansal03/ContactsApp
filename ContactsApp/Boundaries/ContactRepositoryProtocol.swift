//
//  File.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 30/09/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

protocol ContactRepositoryProtocol {
    
    func getAll() -> Result<[Contact]>
    func add(contact: Contact) -> Contact
    func get(index: Int) -> Result<Contact>

}