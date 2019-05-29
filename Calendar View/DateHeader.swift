import Foundation
import UIKit
import JTAppleCalendar

class DateHeader: JTAppleCollectionReusableView  {
    @IBOutlet var monthTitle: UILabel!
    
    func getMonth() -> String{
        var month = monthTitle.text!
        return month
    }
}
