//
//  ScorecardViewController.swift
//  Cricket Match Details Mobile App
//
//  Created by Sanju K Mohamed Sageer on 06/03/24.
//

import UIKit

class ScorecardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var scoreView: UITableView!
    
    
    var viewModel: MatchDetailsViewModel?
    var teamname:String?
    
    var players = [Player]()
    var oppositeBowlers = [Bowler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        populateScorecard()
        
        
    }
    
    @IBAction func BackButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    
    
    func configureTableView() {
        
    }
    
    func populateScorecard() {
        
        scoreView.reloadData()
    }
    
    
}
extension ScorecardViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.viewModel?.matchDetails.matchDetails?.teams?.first?.players?.count ?? 0) + (self.viewModel?.matchDetails.matchDetails?.teams?.last?.bowlers?.count ?? 0)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCardTableViewcell", for: indexPath) as? ScoreCardTableViewcell
        cell?.cardView.layer.cornerRadius = 15
        cell?.cardView
            .layer.masksToBounds = true
        if indexPath.row < self.viewModel?.matchDetails.matchDetails?.teams?.first?.players?.count ?? 0 {
            
            cell?.playerNameLabel.text = players[indexPath.row].name
            cell?.playerStatLabel.text = "Runs:\(players[indexPath.row].runs ?? 0), Balls: \(players[indexPath.row].balls ?? 0), 6's: \(players[indexPath.row].sixes ?? 0), 4's: \(players[indexPath.row].fours ?? 0)"
            cell?.dismmisalLabel.text = "Type: \(players[indexPath.row].dismissal?.type ?? ""), Bowler: \(players[indexPath.row].dismissal?.bowler ?? ""), Fielder: \(players[indexPath.row].dismissal?.fielder ?? "")"
            
        } else {
            cell?.playerNameLabel.text = oppositeBowlers[indexPath.row - players.count].name
            cell?.playerStatLabel.text = "Over:\( oppositeBowlers[indexPath.row - players.count].overs ?? 0), Runs: \(oppositeBowlers[indexPath.row - players.count].runsConceded ?? 0), Wickets: \(oppositeBowlers[indexPath.row - players.count].wickets ?? 0 ) "
            cell?.dismmisalLabel.isHidden = true
            
            
            
        }
        
        
        return cell!
        
    }
}

