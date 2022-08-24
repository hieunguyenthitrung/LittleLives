//
//  EventCell.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 23/08/2022.
//

import Foundation
import UIKit


class EventTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contentLbl: UILabel!
    
    static let identifier = "EventTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "EventCell", bundle: nil)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setContentsForCell(userEvent : UserEvent){
        let name = (userEvent.eventSnapshot as! Event).schoolName
        let date = Utils.convertDateToFormatDate((userEvent.eventSnapshot as! Event).eventDate)
        let string = (name != "" ? (name + " created an event ") : "An event ") + (userEvent.eventSnapshot as! Event).eventTitle + " on " + date
        self.contentLbl.attributedText =  NSMutableAttributedString().boldText(string, boldTexts: [(userEvent.eventSnapshot as! Event).schoolName , (userEvent.eventSnapshot as! Event).eventTitle])
    }
    
    @IBAction func addTouchUp(_ sender: Any) {
    }
    
}
