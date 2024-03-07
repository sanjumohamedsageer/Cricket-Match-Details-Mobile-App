//
//  DataManager.swift
//  Cricket Match Details Mobile App
//
//  Created by Sanju K Mohamed Sageer on 06/03/24.
//

import Foundation
class DataManager {
    
    
    func parseMatchDetails(from jsonData: Data) -> MatchDetails? {
        do {
            let decoder = JSONDecoder()
            let matchDetails =  try decoder.decode(MatchDetails.self, from: jsonData)
            return matchDetails
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
