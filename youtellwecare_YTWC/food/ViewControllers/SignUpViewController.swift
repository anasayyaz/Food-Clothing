 //
//  SignUpViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 08/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
 import FirebaseAuth
 import Firebase
 
class SignUpViewController: UIViewController {

    @IBOutlet weak var FirstNameTextField: UITextField!
    
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    
    @IBOutlet weak var ErrorLabel: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        setUpElements()
              
          }
          
          func setUpElements(){
               
              ErrorLabel.alpha = 0
              
              Utilities.styleTextField(FirstNameTextField)
              
              Utilities.styleTextField(LastNameTextField)
              
              Utilities.styleTextField(EmailTextField)
              
              Utilities.styleTextField(PasswordTextField)
              
              Utilities.styleFilledButton(SignUpButton)
              
               
              
              
              
          }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func validateFields() -> String? {
    
    
        
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "please fill inall the fields"
        }
    
        
        
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if  Utilities.isPasswordValid(cleanedPassword) == false{
            
            return "please make sure your password is at least 8 characters,  contains a number and a special character"
            
        }
        
        
    return nil
    }
    
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
    
    
    

   let error = validateFields()
         
         if error != nil{
             
             showError(error!)
             
         }
         else{
             
             let firstName = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let lastName = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             
             Auth.auth().createUser(withEmail: email , password: password) { (results, err) in
                 if err != nil {
                     self.showError("error creating user")
                     
                 }
                 else {
                     
                     let db = Firestore.firestore()
                     db.collection("users").addDocument(data: ["firstName":firstName, "lastName":lastName, "uid":results!.user.uid ]) { (error ) in
                         if error != nil{
                             self.showError("error saving user data")
                         }
                     
                     }
                     
                     self.transitionToHome()
                 }
             }
         }
         
     }
         func showError(_ message:String){
             
             ErrorLabel.text = message
             ErrorLabel.alpha = 1
             
         }
     
     
     
     func transitionToHome(){
         
       let homeViewController =   storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
         
         view.window?.rootViewController = homeViewController
         view.window?.makeKeyAndVisible()
         
     }
 }



     
     



