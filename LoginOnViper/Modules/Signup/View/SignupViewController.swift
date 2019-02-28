

import UIKit

class SignupViewController: UIViewController, SignupViewControllerProtocol {
    
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func didTapSignupButton(sender: AnyObject) {
        var inputDictionary = [String:AnyObject]()
        inputDictionary["name"] = self.nameTextField.text as AnyObject
        inputDictionary["password"] = self.passwordTextField.text as AnyObject
        let userModel = UserModel(inputDictionary: inputDictionary)
        self.interactor?.createUser(userModel: userModel)
    }
    
    var dismissButton: UIButton!
    var logoView: UIImageView!
    var footerView: UIImageView!
    var interactor: SignupInteractor?
    var navigation: SignupWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addUI()
        setupConstraints()
    }
    
    func addUI() {
        dismissButton = UIButton(frame: .zero)
        dismissButton.setImage(#imageLiteral(resourceName: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(didTapDissmisButton), for: .touchUpInside)
        view.addSubview(dismissButton)
        logoView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        view.addSubview(logoView)
        footerView = UIImageView(image: #imageLiteral(resourceName: "footer"))
        view.addSubview(footerView)
        
        nameTextField.add(placeholder: "name", with: Config.Colors.text)
        nameTextField.textColor = Config.Colors.second
        nameTextField.addBottomBorder(with: Config.Colors.second)
        
        emailTextField.add(placeholder: "email", with: Config.Colors.text)
        emailTextField.textColor = Config.Colors.second
        emailTextField.addBottomBorder(with: Config.Colors.second)
        
        passwordTextField.add(placeholder: "password", with: Config.Colors.text)
        passwordTextField.textColor = Config.Colors.second
        passwordTextField.addBottomBorder(with: Config.Colors.second)
        
        signupButton.backgroundColor = Config.Colors.second
        signupButton.setTitleColor(Config.Colors.buttonText, for: .normal)
        signupButton.layer.cornerRadius = 20
    }
    
    func setupConstraints() {
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 145).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 183).isActive = true
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 289).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 289).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 289).isActive = true
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func didTapDissmisButton(sender: AnyObject) {
        self.navigation?.dismissSignupViewController()
    }
    
    func userCreationShow(isSaved: Bool) {
        if isSaved {
            print("Success: User created!")
            self.navigation?.presentHomeScreen()
        } else {
            print("Failure: User did not store!")
        }
    }

}
