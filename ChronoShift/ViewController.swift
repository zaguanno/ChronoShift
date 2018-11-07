import UIKit

struct User {
    let first: String
    let last: String
    let email: String
    let shifts: [Company]?
    let admins: [Company]?
}

class LoginViewController: UIViewController {
    let cComcast = Company(name: "Comcast", logo: "cmcsa_logo")
    let cSmoakHaus = Company(name: "SmoakHaus", logo: "smoakhaus_logo2")
    
    var allUsers: [User] = []
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        let userZach = User(first: "Zach", last: "Smoak", email: "zsmoak@gmail.com", shifts: [cComcast, cSmoakHaus], admins: [cSmoakHaus])
        let userJordan = User(first: "Jordan", last: "Prewitt", email: "jordan.prewitt@gmail.com", shifts: [cSmoakHaus], admins: [])
        
        allUsers.append(userZach)
        allUsers.append(userJordan)
    }
    
    func loginButton(_ loginButton: UIButton, didSelectItemAt indexPath: IndexPath) {
        var user: User?
        var thisUser = 0
        user = allUsers[thisUser]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainMenuViewController = storyboard.instantiateViewController(withIdentifier: "MainMenu") as! MainMenuViewController
        
        if let u = user {
            mainMenuViewController.user = u
        }
        
        //since you are pushing this to a stack - ie back button. It should be instead loaded on a UINavigationController
        self.present(mainMenuViewController, animated: true) {}
    }
}
