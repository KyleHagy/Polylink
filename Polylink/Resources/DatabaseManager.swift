//
//  DatabaseManager.swift
//  Polylink
//
//  Created by Curse on 2/21/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {

    static let shared = DatabaseManager()

    private let database = Database.database().reference()

}

// MARK: - Account Mgmt
extension DatabaseManager {

    //Validates that the email hasnt been used or has been used
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
        
        //becasue the database dosnt take @ and .
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }

            completion(true)
        })

    }

    /// Inserts NEW user to database
    public func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

//Data of each user
struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    //database error with @ and . so we convert those later and store with -
    var safeEmail: String{
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
//    let profilePictureUrl: String
}
