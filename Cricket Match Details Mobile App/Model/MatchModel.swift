//
//  MatchModel.swift
//  Cricket Match Details Mobile App
//
//  Created by Sanju K Mohamed Sageer on 06/03/24.
//

import Foundation

struct MatchDetails: Codable {
    let matchDetails: MatchDetailsModel?
}
struct MatchDetailsModel: Codable {
    let format: String?
    let toss: String?
    let toss_decision: String?
    let teams: [Team]?
    let fallOfWickets: [FallOfWickets]?
}

struct Team: Codable {
    let name: String?
    let players: [Player]?
    let bowlers: [Bowler]?
}

struct Player: Codable {
    let name: String?
    let runs: Int?
    let balls: Int?
    let fours: Int?
    let sixes: Int?
    let dismissal: Dismissal?
}

struct Bowler: Codable {
    let name: String?
    let overs: Int?
    let runsConceded: Int?
    let wickets: Int?
}

struct Dismissal: Codable {
    let type: String?
    let fielder: String?
    let bowler: String?
}

struct FallOfWickets: Codable {
    let team: String?
    let wickets: [Wicket]?
}

struct Wicket: Codable {
    let player: String?
    let score: Int?
    let overs: Double?
    let dismissal: Dismissal?
}



