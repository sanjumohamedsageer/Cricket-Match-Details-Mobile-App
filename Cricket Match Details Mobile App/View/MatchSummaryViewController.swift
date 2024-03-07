//
//  MatchSummaryViewController.swift
//  Cricket Match Details Mobile App
//
//  Created by Sanju K Mohamed Sageer on 06/03/24.
//

import UIKit

class MatchSummaryViewController: UIViewController {
    @IBOutlet weak var tossLabel: UILabel!
    @IBOutlet weak var tossDecisionLabel: UILabel!
    @IBOutlet weak var totalRunsTeamALabel: UILabel!
    @IBOutlet weak var totalRunsTeamBLabel: UILabel!
    @IBOutlet weak var totalOversTeamALabel: UILabel!
    @IBOutlet weak var totalOversTeamBLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winningMarginLabel: UILabel!
    
    @IBOutlet weak var tossView: UIView!
    
    @IBOutlet weak var teamBView: UIView!
    @IBOutlet weak var teamAView: UIView!
    
    
    @IBOutlet weak var resultView: UIView!
    
    var viewModel: MatchDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        bindViewModel()
        updateView()
        
    }
    
    
    func data() {
        
        guard let sourcesURL = Bundle.main.url(forResource: "status", withExtension: "json") else {
            fatalError("could not find status.json")
        }
        guard let matchData = try? Data(contentsOf:sourcesURL) else {
            fatalError("could not convert json ")
        }
        print(String(data: matchData, encoding: .utf8) ?? "Invalid JSON data")
        
        let dataManager = DataManager()
        if let matchDetails = dataManager.parseMatchDetails(from: matchData) {
            let viewModel = MatchDetailsViewModel(matchDetails: matchDetails)
            
            self.viewModel = viewModel
            
            
        } else {
            print("Failed to parse match details")
        }
        
    }
    
    @IBAction func teamAbuttonAction(_ sender: UIButton) {
        if let navigationController = navigationController {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScorecardViewController") as! ScorecardViewController
            viewController.viewModel = self.viewModel
            viewController.players = (self.viewModel?.matchDetails.matchDetails?.teams?.first?.players)!
            viewController.oppositeBowlers = (self.viewModel?.matchDetails.matchDetails?.teams?.last?.bowlers)!
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func teamBButtonAction(_ sender: UIButton) {
        if let navigationController = navigationController {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScorecardViewController") as! ScorecardViewController
            viewController.viewModel = self.viewModel
            viewController.players = (self.viewModel?.matchDetails.matchDetails?.teams?.last?.players)!
            viewController.oppositeBowlers = (self.viewModel?.matchDetails.matchDetails?.teams?.first?.bowlers)!
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    func updateView() {
        tossView.layer.cornerRadius = 15;
        tossView.layer.masksToBounds = true;
        resultView.layer.cornerRadius = 15;
        resultView.layer.masksToBounds = true;
        teamAView.layer.cornerRadius = 15;
        teamAView.layer.masksToBounds = true;
        teamBView.layer.cornerRadius = 15;
        teamBView.layer.masksToBounds = true;
    }
    
    func bindViewModel() {
        
        
        
        tossLabel.text = "Toss Won: \(viewModel?.matchDetails.matchDetails?.toss ?? "")"
        tossDecisionLabel.text = "Toss Decision: \(viewModel?.matchDetails.matchDetails?.toss_decision ?? "")"
        totalRunsTeamALabel.text = "Team A Total Runs: \(viewModel?.totalRunsTeamA ?? 0)"
        totalRunsTeamBLabel.text = "Team B Total Runs: \(viewModel?.totalRunsTeamB ?? 0)"
        totalOversTeamALabel.text = "Team A Total Overs: \(viewModel?.totalOversBowledTeamA ?? 0)"
        totalOversTeamBLabel.text = "Team B Total Overs: \(viewModel?.totalOversBowledTeamB ?? 0)"
        winningMarginLabel.text = "Winning Margin: \(viewModel?.winningMargin ?? 0)"
        if viewModel!.totalRunsTeamA > viewModel!.totalRunsTeamB {
            winnerLabel.text = "Winner is Team A"
        }else {
            winnerLabel.text = "Winner is Team B"
        }
        
    }
    
    
    
}
