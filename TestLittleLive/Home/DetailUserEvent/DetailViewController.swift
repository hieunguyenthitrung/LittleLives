//
//  DetailViewController.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 23/08/2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var eventTypeLbl: UILabel!
    
    var userEvent : UserEvent!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "DETAIL EVENT"
        
        if(userEvent.eventType.contains(EventType.CheckOutType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "person.fill.checkmark")
            self.eventTypeLbl.text = EventStringType.CheckOutType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else if(userEvent.eventType.contains(EventType.CheckInType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "person.fill.checkmark")
            self.eventTypeLbl.text = EventStringType.CheckOutType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else if(userEvent.eventType.contains(EventType.StoryExportedType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "book")
            self.eventTypeLbl.text = EventStringType.StoryExportedType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else if( userEvent.eventType.contains(EventType.StoryPublishedType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "book")
            self.eventTypeLbl.text = EventStringType.StoryPublishedType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else if(userEvent.eventType.contains(EventType.HealthType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "stethoscope")
            self.eventTypeLbl.text = EventStringType.HealthType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else if(userEvent.eventType.contains(EventType.PortfolioType.rawValue)){
            self.iconImageView.image = UIImage(systemName: "folder.fill.badge.gearshape")
            self.eventTypeLbl.text = EventStringType.PortfolioType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }
        else{
            self.iconImageView.image = UIImage(systemName: "calendar")
            self.eventTypeLbl.text = EventStringType.EventType.rawValue
            self.descriptionLbl.text = userEvent.eventDescription
            self.dateLbl.text = Utils.convertDateToDate(userEvent.eventDate)
        }

    }
}
