import UIKit
import AVFoundation

// MARK: - Class

final class MainMenuViewController: ViewController<MainMenuView> {
    
    // MARK: - Private variables
    
    private let viewModel: MainMenuViewModel
    
    // MARK: - Initializer
    
    init(viewModel: MainMenuViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.loadGameButton.isEnabled = false
        self.customView.secretButton.isEnabled = false
        setupRX()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        backgroundMusic(play: Sounds.background_nirvana)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopSound()
    }
}

extension MainMenuViewController {
    
    // MARK: - Private methods
    
    private func setupRX() {
        self.customView.closeButton.addTarget(self, action: #selector(closeGame), for: .touchUpInside)
        self.customView.configGameButton.addTarget(self, action: #selector(configGame), for: .touchUpInside)
        self.customView.startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func closeGame(sender: UIButton!) {
        exit(0);
    }
    
    @objc func startGame(sender: UIButton!) {
        playSound(Sounds.amongSound)
    }
    
    @objc func configGame(sender: UIButton!) {
        playSound(Sounds.touchSound)
    }
}
