//
//  HealthCell.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 23/08/2022.
//

import Foundation
import UIKit


class HealthTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contentLbl: UILabel!
    
    static let identifier = "HealthTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "HealthCell", bundle: nil)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setContentsForCell(userEvent : UserEvent){
        
        self.contentLbl.text =  (userEvent.eventSnapshot as! EventHealth).childName
        
    }
}
