/*
     _ ___  ___  _  _
  _ | / __|/ _ \| \| |
 | || \__ \ (_) | .` |
  \__/|___/\___/|_|\_|
 */

import Foundation

let json = """
 {
    "type": "US Robotics",
    "model": "Sportster"
 }
"""

// JSON > Swift (struct or class)
struct Modem: Codable {
    let type: String
    let model: String
}

let jsonData = json.data(using: .utf8)!
let result = try! JSONDecoder().decode(Modem.self, from: jsonData)

result
result.type
result.model

// Swift > JSON
var modem = Modem(type: "Hayes", model: "5611")

let jsonData2 = try! JSONEncoder().encode(modem)
let json2 = String(data: jsonData2, encoding: .utf8)!
json2

// What if Swift properties differ from from JSON? CodingKeys
struct User:Codable
{
    var firstName:String
    var lastName:String
    var country:String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country
    }
}

let jsonUser = """
{
    "first_name": "John",
    "last_name": "Doe",
    "country": "United Kingdom"
}
"""

let jsonUserData = jsonUser.data(using: .utf8)!
let userResult = try! JSONDecoder().decode(User.self, from: jsonUserData)
userResult.firstName

// Other Codable data types include
// - URL, Number, Bool, Array, Dictionary Date, Null, other JSON objects
let jsonOtherTypes = """
 {
     "name": "The Witcher",
     "seasons": 1,
     "rate": 9.3,
     "favorite": null,
     "genres":["Animation", "Comedy", "Drama"],
     "countries":{"Canada":"CA", "United States":"USA"},
     "platform": {
         "name": "Netflix",
         "ceo": "Reed Hastings"
     },
    "url":"https://en.wikipedia.org/wiki/BoJack_Horseman"
 }
"""

struct Show: Decodable {
    let name: String
    let seasons: Int
    let rate: Float
    let favorite: Bool?
    let genres: [String]
    let countries: Dictionary<String, String>
    let platform: Platform
    let url: URL
    
    struct Platform: Decodable {
        let name: String
        let ceo: String
    }
}

let jsonOtherData = jsonOtherTypes.data(using: .utf8)!
let showResult = try! JSONDecoder().decode(Show.self, from: jsonOtherData)
print(showResult)
