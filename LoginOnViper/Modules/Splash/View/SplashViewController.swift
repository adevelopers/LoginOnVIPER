

import UIKit

class SplashViewController: UIViewController, SplashViewControllerProtocol {
    
    var navigation: SplashWireframe?
    var buttonLogin: UIButton!
    var buttonSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addUI()
        setupConstraints()
    }
    
    func addUI() {
        buttonLogin = UIButton(frame: .zero)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(Config.Colors.buttonText, for: .normal)
        buttonLogin.backgroundColor = Config.Colors.first
        buttonLogin.layer.cornerRadius = 20
        view.addSubview(buttonLogin)
        
        buttonLogin.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        buttonSignUp = UIButton(frame: .zero)
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.setTitleColor(Config.Colors.buttonText, for: .normal)
        buttonSignUp.backgroundColor = Config.Colors.second
        buttonSignUp.layer.cornerRadius = 20
        view.addSubview(buttonSignUp)
        buttonSignUp.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        
        
    }
    
    func setupConstraints() {
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        buttonSignUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonSignUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        buttonSignUp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.bottomAnchor.constraint(equalTo: buttonSignUp.topAnchor, constant: -10).isActive = true
        buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func didTapSignupButton(sender: AnyObject) {
        self.navigation?.presentSignupViewController()
    }
    
    @objc func didTapLoginButton(sender: AnyObject) {
        self.navigation?.presentLoginViewController()
    }

}
