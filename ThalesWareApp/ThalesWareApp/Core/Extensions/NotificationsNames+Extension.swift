import Foundation

extension Notification {
    init(name: Notification.Name) {
        self.init(name: name, object: nil)
    }
}

extension NotificationCenter {
    func postNotification(named name: Notification.Name) {
        let notif = Notification(name: name)
        post(notif)
    }
}

public extension Notification.Name {
   static var landscapeOrientation = Notification.Name("landscapeOrientation")
   static var portraitOrientation = Notification.Name("portraitOrientation")
   static var sessionExpired = Notification.Name("sessionExpired")
}
