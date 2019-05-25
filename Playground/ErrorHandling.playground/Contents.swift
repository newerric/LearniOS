enum NameInputError: Error {
    case empty
    case isNumber
}

func getUserFullname(firstname: String, lastname: String) throws -> String {
    if firstname == "" || lastname == "" {
        throw NameInputError.empty
    } else if Int(firstname) != nil || Int(lastname) != nil {
        throw NameInputError.isNumber
    }
    
    let fullname = firstname + " " + lastname
    return fullname
}

do {
//    try getUserFullname(firstname: "", lastname: "CEO")
//    try getUserFullname(firstname: "123", lastname: "CEO")
    try getUserFullname(firstname: "Mike", lastname: "CEO")
} catch NameInputError.empty {
    print("empty name")
} catch NameInputError.isNumber {
    print("input some number")
} catch {
    print("something wrong")
}



