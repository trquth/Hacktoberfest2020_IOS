//
//  Protocol.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/30/20.
//

import Foundation

protocol ChooseNationPopUpDelegate {
    func closeChooseNationPopUp()
}

protocol PhoneNumberInputDelegate {
    func openChooseNationPopUp()
    func onPressPhoneNumberInput()
}
