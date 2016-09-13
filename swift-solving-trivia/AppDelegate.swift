//
//  AppDelegate.swift
//  swift-solving-trivia
//
//  Created by Joel Bell on 7/8/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // Problems statement:
    // What is the only state whose capital contains none of the characters as the state name?
    // Example: Alaska is not the answer because Juneau and Alaska both contain an A.
    
    func solveTrivia(stateCapitals: Dictionary<String, String>) -> String {
        var stateWithoutCharInCapital: String?

        for state in stateCapitals.keys { // iterate over all the states in the dictionary
            var capitalCharMatchesStateChar:Bool = false
            if let capital = stateCapitals[state] { // unwrap the capital
                for capitalChar in capital.characters { // iterate over the chars in capital
                    capitalCharMatchesStateChar = state.localizedCaseInsensitiveContainsString(String(capitalChar)) // look for a match
                    if capitalCharMatchesStateChar {
                        print("\(capitalChar) from \(capital) was found in \(state).")
                        break
                    }
                }
                if !capitalCharMatchesStateChar {
                    // goal met: found a state name where none of the characters match the characters in the capital, return the state name
                    print("**** No character in \(capital) was found in \(state). ****")
                    stateWithoutCharInCapital = state
                }
            }
        }
        return (stateWithoutCharInCapital)!
    }
}

