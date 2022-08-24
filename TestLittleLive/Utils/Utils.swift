//
//  Utils.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import Foundation
import UIKit

class Utils {
    
    static func convertDateToFormatDate(_ string : String) -> String{
        let f:DateFormatter = DateFormatter()
        f.locale = Foundation.Locale(identifier: "en")
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let date = f.date(from: string)
        f.dateFormat = "dd MMM yyyy, hh:mm a"
        let stringDate = f.string(from: date!)
        return stringDate
    }
    
    
    static func convertDateToDate(_ string : String) -> String{
        let f:DateFormatter = DateFormatter()
        f.locale = Foundation.Locale(identifier: "en")
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = f.date(from: string)
        f.dateFormat = "dd MMM yyyy, hh:mm a"
        let stringDate = f.string(from: date!)
        return stringDate
    }
}

extension String {
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
    
    var parseHTMLJson: [String:AnyObject]?{
        do{
            if let jsonData = try JSONSerialization.jsonObject(with: Data(utf8), options: .allowFragments) as? [String:AnyObject]{
                return jsonData
            }
        }catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 13 }
    var boldFont:UIFont { return UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func boldText(_ string : String, boldTexts: [String])->NSMutableAttributedString{
        
        let myMutableString = NSMutableAttributedString(string: string)
        
        for text in boldTexts{
            let boldRange = (string as NSString).range(of: text)
            myMutableString.addAttribute(NSAttributedString.Key.font, value: boldFont, range:boldRange)
        }
        
        return myMutableString
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

