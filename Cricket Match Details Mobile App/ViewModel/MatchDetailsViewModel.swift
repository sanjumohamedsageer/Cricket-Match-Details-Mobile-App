//
//  MatchDetailsViewModel.swift
//  Cricket Match Details Mobile App
//
//  Created by Sanju K Mohamed Sageer on 06/03/24.
//

import Foundation
class MatchDetailsViewModel {
    let matchDetails: MatchDetails
    
    init(matchDetails: MatchDetails) {
        self.matchDetails = matchDetails
    }
    
    var totalPlayeTeamA: Int  {
        return totalplayers(for: "Team A")
    }
    var totalPlayersTeamB:Int {
        return totalplayers(for: "Team B")
    }
    var totalRunsTeamA: Int {
        return totalRuns(for: "Team A")
    }
    
    var totalRunsTeamB: Int {
        return totalRuns(for: "Team B")
    }
    
    var totalOversBowledTeamA: Double {
        return totalOversBowled(for: "Team A")
    }
    
    var totalOversBowledTeamB: Double {
        return totalOversBowled(for: "Team B")
    }
    
    var winningMargin: Int {
        return abs(totalRunsTeamA - totalRunsTeamB)
    }
    
    private func totalRuns(for teamName: String) -> Int {
        guard let team = matchDetails.matchDetails?.teams?.first(where: { $0.name == teamName }) else {
            return 0
        }
        
        let totalRuns = team.players?.reduce(0) { $0 + ($1.runs ?? 0) } ?? 0
        return totalRuns
    }
    
    private func totalOversBowled(for teamName: String) -> Double {
        guard let team = matchDetails.matchDetails?.teams?.first(where: { $0.name == teamName }) else {
            return 0
        }
        
        let totalOvers = team.bowlers?.reduce(0.0) { $0 + Double($1.overs ?? 0) } ?? 0
        return totalOvers
    }
    private func totalplayers(for teamName: String) -> Int {
        
        guard let team = matchDetails.matchDetails?.teams?.first(where: { $0.name == teamName }) else {
            return 0
        }
        
        let numPlayers = team.players?.count ?? 0
        let numBowlers = team.bowlers?.count ?? 0
        return numPlayers + numBowlers
    }
}


