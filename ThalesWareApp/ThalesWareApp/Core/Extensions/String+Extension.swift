import UIKit
import Foundation

public extension String {
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var length: Int {
        get {
            return self.count
        }
    }
    
    var removeSpecialChars: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890-")
        return self.filter {okayChars.contains($0) }
    }
    
    var removeEmoji: String {
        return self.components(separatedBy: CharacterSet.symbols).joined()
    }
    
    var alphanumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }
    
    var alphanumericWithWhiteSpace: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.union(.whitespaces).inverted).joined()
    }
    
    var lettersWithWhiteSpace: String {
        return self.components(separatedBy: CharacterSet.letters.union(.whitespaces).inverted).joined()
    }
    
    var numbers: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    private var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue
                                          ], documentAttributes: nil)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func convertHtmlToAttributedStringWithCSS(font: UIFont?, csscolor: String, lineheight: Int, csstextalign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
        
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue
                                          ], documentAttributes: nil)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {okayChars.contains($0) }
    }
}
