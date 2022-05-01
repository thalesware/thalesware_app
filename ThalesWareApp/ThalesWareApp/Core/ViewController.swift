import UIKit
import AVFoundation

open class ViewController<View: UIView>: UIViewController {
    
    public var audioPlayer = AVAudioPlayer()
    public var backgroundAudioPlayer = AVAudioPlayer()
    
    public var customView: View {
        return view as! View
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = View()
    }
    
    public func playSound(_ sound: Sounds, repeatMode: Bool = false) {
        guard let url = Bundle.main.path(forResource: sound.sound, ofType: nil) else { return }
        
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
        if repeatMode {
            audioPlayer.numberOfLoops = -1
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    public func backgroundMusic(play sound: Sounds) {
        guard let url = Bundle.main.path(forResource: sound.sound, ofType: nil) else { return }
        
        backgroundAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
        backgroundAudioPlayer.numberOfLoops = -1
        backgroundAudioPlayer.prepareToPlay()
        backgroundAudioPlayer.play()
    }
    
    public func stopSound(background: Bool = true) {
        if background {
            backgroundAudioPlayer.stop()
        } else {
            audioPlayer.stop()
        }
    }
}
