//
//  ListPresenter.swift
//  ContactsApp
//
//  Created by Davide Mendolia on 30/09/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

struct ListPresenter {
    let ui: ListUI
    let getContactUseCase: GetContacts
    let addContactUseCase: AddContact

    func onInitialize() -> Result<()> {
        return loadContacts()
    }

    private func loadContacts()  -> Result<()> {
        return getContactUseCase.execute().map { contacts in
            return self.ui.showContacts(contacts)
        }
    }

    private func isValidName(input: String) -> Bool {
        return !input.isEmpty
    }

    private func isValidPhonenumber(input: String) -> Bool {
        return !input.isEmpty
    }

    private func isContactInfoValid(firstName: String, lastName: String, phonenumber: String) -> Bool {
        return !isValidName(firstName)
            || !isValidName(lastName)
            || !isValidPhonenumber(phonenumber)
    }

    func onInputContact() -> Result<()> {
        return ui.getFirstName().map { firstName in
            return self.ui.getLastName().map { lastName in
                return self.ui.getPhone().map { phonenumber ->  Result<()> in
                    if self.isContactInfoValid(firstName, lastName: lastName, phonenumber: phonenumber) {
                        self.ui.showError()
                        return self.onInputContact()
                    }
                    self.addContactUseCase.execute(
                        NewContact(
                            firstName: firstName,
                            lastName: lastName,
                            phonenumber: phonenumber
                        )
                    )

                    return self.loadContacts()
                }
            }
        }
    }
}

struct NewContact: Contact {
    let firstName: String
    let lastName: String
    let phonenumber: String
}