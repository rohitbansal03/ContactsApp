//
//  ListOutput.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 30/09/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

struct ListOutput: ListUI {
    func showContacts(contacts: [Contact]) -> Result<()> {
        if contacts.count > 0 {
            contacts.forEach {
                print($0)
            }
             return Result(value: print("Total: \(contacts.count)"))
        } else {
             return Result(value: print("No contacts"))
        }
    }

    func getFirstName() -> Result<String> {
        print("Firstame: ", terminator: "")
        return Result(value: readLine() ?? "")
    }

    func getLastName() -> Result<String> {
        print("Lastname: ", terminator: "")
        return Result(value: readLine() ?? "")
    }

    func getPhone() -> Result<String> {
        print("Phonenumber: ", terminator: "")
        return Result(value: readLine() ?? "")
    }

    func showError() -> Result<()> {
        return Result(value: print("Error !!!!!"))
    }
}