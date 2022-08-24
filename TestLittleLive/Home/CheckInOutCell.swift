//
//  HomeTableViewCell.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import Foundation
import UIKit


class CheckInOutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLbl: UILabel!
    
    @IBOutlet weak var checkInOutImageView: UIImageView!
    
    static let identifier = "CheckInOutTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CheckInOutCell", bundle: nil)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    
    
    func setContentsForCell(userEvent : UserEvent){
        self.contentLbl.attributedText =  NSMutableAttributedString().boldText(userEvent.eventDescription, boldTexts: [(userEvent.eventSnapshot as! EventCheckInOut).msgParams!.childName])
        self.checkInOutImageView.load(url: URL(string: (userEvent.eventSnapshot as! EventCheckInOut).checkinThumb)!)
    }
}
