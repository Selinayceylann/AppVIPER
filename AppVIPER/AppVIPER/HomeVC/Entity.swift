

import Foundation

// MARK: - NameJSONElement
struct NameJSONElement: Codable {
    let id: Int
    let firstname, lastname, email, birthDate: String
    let login: Login
    let address: Address
    let phone: Phone
    let website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite: String
    let city: City
    let zipcode: Zipcode
    let geo: Geo
}

enum City: String, Codable {
    case anytown = "Anytown"
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

enum Zipcode: String, Codable {
    case the123456789 = "12345-6789"
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

// MARK: - Login
struct Login: Codable {
    let uuid, username: String
    let password: Password
    let md5: Md5
    let sha1: Sha1
    let registered: String
}

enum Md5: String, Codable {
    case c1328472C5794A25723600F71C1B4586 = "c1328472c5794a25723600f71c1b4586"
}

enum Password: String, Codable {
    case jsonplaceholderOrg = "jsonplaceholder.org"
}

enum Sha1: String, Codable {
    case the35544A31Cc19Bd6520Af116554873167117F4D94 = "35544a31cc19bd6520af116554873167117f4d94"
}

enum Phone: String, Codable {
    case the5555551234 = "(555) 555-1234"
    case the5555553456 = "(555) 555-3456"
    case the5555555678 = "(555) 555-5678"
    case the5555556789 = "(555) 555-6789"
    case the5555559012 = "(555) 555-9012"
}

