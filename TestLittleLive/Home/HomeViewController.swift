//
//  ViewController.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var userEvents : [UserEvent]?
    var currentSize = 0
    let pageSize = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = "USER EVENTS"
        
        self.userEvents = ReadFile.readLocalFile(forName: "user_stories") ?? [UserEvent]()
        currentSize = self.userEvents!.count <= pageSize ? self.userEvents!.count : pageSize;
        tableView.register(CheckInOutTableViewCell.nib(), forCellReuseIdentifier: CheckInOutTableViewCell.identifier)
        tableView.register(PortFolioTableViewCell.nib(), forCellReuseIdentifier: PortFolioTableViewCell.identifier)
        tableView.register(StoryTableViewCell.nib(), forCellReuseIdentifier: StoryTableViewCell.identifier)
        tableView.register(HealthTableViewCell.nib(), forCellReuseIdentifier: HealthTableViewCell.identifier)
        tableView.register(EventTableViewCell.nib(), forCellReuseIdentifier: EventTableViewCell.identifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentSize
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userEvent = self.userEvents![indexPath.row]
        
        if(indexPath.row == currentSize - 1 && currentSize < self.userEvents!.count){
            let exist = self.userEvents!.count - currentSize
            let count = (exist >= 0 && exist < 10 ? self.userEvents!.count : currentSize + pageSize)
            currentSize = count
        }
        
        if(userEvent.eventType.contains(EventType.CheckOutType.rawValue) || userEvent.eventType.contains(EventType.CheckInType.rawValue)){
            let cell : CheckInOutTableViewCell =  tableView.dequeueReusableCell(withIdentifier: CheckInOutTableViewCell.identifier, for: indexPath) as! CheckInOutTableViewCell
            cell.setContentsForCell(userEvent: userEvent)
            cell.selectionStyle = .default
            return cell
        }
        else if(userEvent.eventType.contains(EventType.StoryExportedType.rawValue) || userEvent.eventType.contains(EventType.StoryPublishedType.rawValue)){
            let cell : StoryTableViewCell =  tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as! StoryTableViewCell
            cell.setContentsForCell(userEvent: userEvent)
            cell.selectionStyle = .default
            return cell
        }
        else if(userEvent.eventType.contains(EventType.HealthType.rawValue)){
            let cell : HealthTableViewCell =  tableView.dequeueReusableCell(withIdentifier: HealthTableViewCell.identifier, for: indexPath) as! HealthTableViewCell
            cell.setContentsForCell(userEvent: userEvent)
            cell.selectionStyle = .default
            return cell
        }
        else if(userEvent.eventType.contains(EventType.PortfolioType.rawValue)){
            let cell : PortFolioTableViewCell =  tableView.dequeueReusableCell(withIdentifier: PortFolioTableViewCell.identifier, for: indexPath) as! PortFolioTableViewCell
            cell.setContentsForCell(userEvent: userEvent)
            cell.selectionStyle = .default
            return cell
        }
        else{
            let cell : EventTableViewCell =  tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as! EventTableViewCell
            cell.setContentsForCell(userEvent: userEvent)
            cell.selectionStyle = .default
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userEvent = self.userEvents![indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.userEvent = userEvent
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


