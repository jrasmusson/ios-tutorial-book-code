/*
     _ ___  ___  _  _     _                  _
  _ | / __|/ _ \| \| |   /_\  _ _ __ __ _ __| |___
 | || \__ \ (_) | .` |  / _ \| '_/ _/ _` / _` / -_)
  \__/|___/\___/|_|\_| /_/ \_\_| \__\__,_\__,_\___|
 */

import Foundation

/*
🕹 Find the base.
 
 Create a Swift struct called `Coordinate` capable of decoding the incoming JSON message.
 */

let json1 = """
{
    "latitude": 44.4,
    "longitude": 55.5,
}
"""


/*
🕹 Associate it with a Planet.
 
 Create a Swift struct called `Planet` to include the following coordinate.
 */

let json2 = """
 {
     "name": "Tatooine",
     "foundingYear": 1977,
     "location": {
         "latitude": 44.4,
         "longitude": 55.5,
     },
 }
"""


/*
🕹 Use the force.
 
 Alter the `Planet` struct we just created so it can handle
 
 case name = "planet_name"
 case foundingYear = "founding_year"
 
 */

let json3 = """
 {
     "planet_name": "Tatooine",
     "founding_year": 1977,
     "location": {
         "latitude": 44.4,
         "longitude": 55.5,
     },
 }
"""
