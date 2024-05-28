import Foundation
import UIKit


public extension UITableView {
    
    func dequeue<T: UITableViewCell>(
        cellForRowAt indexPath: IndexPath
    ) -> T {
        return dequeueReusableCell(
            withIdentifier: "\(T.self)",
            for: indexPath
        ) as! T
    }
    
    func registerCellNib<T: UITableViewCell>(
        _ cell: T.Type
    ) {
        let nib = UINib(
            nibName: "\(cell.self)",
            bundle: nil
        )
        register(
            nib,
            forCellReuseIdentifier: T.reuseIdentifier
        )
    }
    
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(
            describing: self
        )
    }
}
