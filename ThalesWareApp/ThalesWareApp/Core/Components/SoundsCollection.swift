public enum Sounds {
    case amongSound, touchSound, background_nirvana
    
    var sound: String {
        switch self {
        case .amongSound:
            return "among.mp3"
        case .touchSound:
            return "touch.mp3"
        case .background_nirvana:
            return "background_nirvana.mp3"
        }
    }
}
