

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
  
    @IBOutlet weak var imageLogin: UIImageView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = "Ingresa tu correo"
        passwordTextField.text = "Ingresa tu Contraseña"
       
    }

    
    @IBAction func button(_ sender: Any) {
        
        let vc = ListViewController()
        self.navigationController?.pushViewController(vc,animated:true)
        
       
    
    
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
}
    

