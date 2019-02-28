

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var deleteUserButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func didTapLogoutButton(sender: AnyObject) {
        self.navigation?.dismissHomeViewController()
    }
    
    @IBAction func didTapDeleteUserButton(sender: AnyObject) {
        self.interator?.deleteUser()
        self.navigation?.dismissHomeViewController()
    }
    
    var logoView: UIImageView!
    var interator: HomeInteractor?
    var navigation: HomeWireframe?
    
    var model: UserModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addUI()
        setupConstraints()
        presentWelcome()
    }
    
    func addUI() {
        logoView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        view.addSubview(logoView)
        
        labelWelcome.textColor = Config.Colors.first
        
        logoutButton.layer.cornerRadius = 20
        logoutButton.backgroundColor = Config.Colors.second
        logoutButton.setTitleColor(Config.Colors.buttonText, for: .normal)
        
        deleteUserButton.layer.cornerRadius = 20
        deleteUserButton.backgroundColor = Config.Colors.first
        deleteUserButton.setTitleColor(Config.Colors.buttonText, for: .normal)
    }
    
    func setupConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.bottomAnchor.constraint(equalTo: deleteUserButton.topAnchor, constant: -30).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        deleteUserButton.translatesAutoresizingMaskIntoConstraints = false
        deleteUserButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        deleteUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteUserButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        deleteUserButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}

extension HomeViewController {
    
    func configure(with user: UserModelProtocol) {
        model = user
    }
    
    func presentWelcome() {
        guard let user = model else {
            return
        }
        labelWelcome.text = " Welcome! " + user.userName
    }
}
