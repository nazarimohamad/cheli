//
//  CreateNewTodo.swift
//  klich
//
//  Created by Ryan Nazari on 5/12/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import  RealmSwift


protocol AddNewItemDelegate {
    func addNewItem(item: Object)
}


class CreateTodo: UIViewController {
    
     let realm = try! Realm()
     var item: Results<Item>?
    
    var newItemDelegate: AddNewItemDelegate!
    
    let blackView = UIView()
    
    let whiteView: UIView = {
        let whiteView = UIView()
        whiteView.layer.cornerRadius = 8
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    
    func createNewItem() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.frame = window.frame
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(whiteView)
            
            blackView.alpha = 0
            let y = window.frame.height / 2 - 200
            whiteView.frame = CGRect(x: -(window.frame.width), y: 0, width: window.frame.width - 40, height: 400)
            
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                
                self.blackView.alpha = 1
                self.whiteView.frame = CGRect(x: 20, y: y, width: window.frame.width - 40, height: 400)
            })
        }
    }
    
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.whiteView.frame = CGRect(x: window.frame.width, y: 0, width: window.frame.width - 40, height: 400)
            }
        
        })
    }
    
    
    @objc func handleSelectedButton() {
        UIView.animate(withDuration: 0.3) {
            self.goalButton.isHidden = !self.goalButton.isHidden
            self.IdeaButton.isHidden = !self.IdeaButton.isHidden
            self.whiteView.layoutIfNeeded()
        }
    }
    
    @objc func handleVisionButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.goalButton.isHidden = true
            self.IdeaButton.isHidden = true
            self.selectedButton.setTitle(sender.currentTitle, for: .normal)
            self.whiteView.layoutIfNeeded()
        }
    }
    
    
    @objc func handleCreateItemButtomPressed() {
        
        let newItem = Item()
        
        guard let title = titleTextField.text else {return}
        guard let description = descTextView.text else {return}
        guard let vision = selectedButton.currentTitle else {return}

        
        if title.isEmpty || description.isEmpty {
            print("the field is empthy")
        } else {
            newItem.title = title
            newItem.desc = description
            newItem.vision = vision
            newItem.date = Date()
            
            newItemDelegate.addNewItem(item: newItem)
            clearTextInputs()
        }
        
    }
    
    
    func clearTextInputs() {
        titleTextField.text = ""
        descTextView.text = ""
        selectedButton.setTitle("tap to select your vision", for: .normal)
        
        textViewDidEndEditing(descTextView)
        handleDismiss()
    }
    
    // MARK: Initialzing the class
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        
        stackView.addArrangedSubview(selectedButton)
        stackView.addArrangedSubview(goalButton)
        stackView.addArrangedSubview(IdeaButton)
        
        whiteView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        whiteView.addSubview(titleTextField)
        titleTextField.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        whiteView.addSubview(descTextView)
        descTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10).isActive = true
        descTextView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10).isActive = true
        descTextView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10).isActive = true
        descTextView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        whiteView.addSubview(createButton)
        createButton.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 10).isActive = true
        createButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10).isActive = true
        createButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    // MARK: Create views
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    lazy var selectedButton: UIButton = {
        let sb = UIButton()
        sb.setTitle("tap to select your vision", for: .normal)
        sb.setTitleColor(.lightGray, for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        sb.layer.borderWidth = 0.3
        sb.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        sb.addTarget(self, action: #selector(handleSelectedButton), for: .touchUpInside)
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    lazy var goalButton: UIButton = {
        let gb = UIButton()
        gb.setTitle("Goal", for: .normal)
        gb.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        gb.backgroundColor = .blue
        gb.isHidden = true
        gb.addTarget(self, action: #selector(handleVisionButton), for: .touchUpInside)
        gb.translatesAutoresizingMaskIntoConstraints = false
        return gb
    }()
    
    lazy var IdeaButton: UIButton = {
        let ib = UIButton()
        ib.setTitle("Idea", for: .normal)
        ib.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        ib.backgroundColor = .red
        ib.isHidden = true
        ib.addTarget(self, action: #selector(handleVisionButton), for: .touchUpInside)
        ib.translatesAutoresizingMaskIntoConstraints = false
        return ib
    }()
    
    let titleTextField: UITextField = {
        let ttf = UITextField()
        ttf.placeholder = "  title for your vision"
        ttf.textAlignment = .center
        ttf.font = UIFont.systemFont(ofSize: 25)
        ttf.borderStyle = .roundedRect
        ttf.layer.masksToBounds = true
        ttf.layer.borderWidth = 0.3
        ttf.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        ttf.translatesAutoresizingMaskIntoConstraints = false
        return ttf
    }()
    
    lazy var descTextView: UITextView = {
        let dtv = UITextView()
        dtv.text = "write description for your vision"
        dtv.textColor = UIColor.lightGray
        dtv.font = UIFont.systemFont(ofSize: 25)
        dtv.layer.masksToBounds = true
        dtv.layer.borderWidth = 0.3
        dtv.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        dtv.delegate = self
        dtv.translatesAutoresizingMaskIntoConstraints = false
        return dtv
    }()
    
    lazy var createButton: UIButton = {
        let cb = UIButton()
        cb.setTitle("Create", for: .normal)
        cb.setTitleColor(.white, for: .normal)
        cb.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        cb.backgroundColor = #colorLiteral(red: 0.1922, green: 0.1922, blue: 0.1922, alpha: 1) /* #313131 */
        cb.layer.cornerRadius = 10
        cb.addTarget(self, action: #selector(handleCreateItemButtomPressed), for: .touchUpInside)
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
}


// MARK: Text view Delegate
extension CreateTodo: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descTextView.textColor == UIColor.lightGray {
            descTextView.text = nil
            descTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descTextView.text.isEmpty {
            descTextView.text = "write description for your vision"
            descTextView.textColor = UIColor.lightGray
        }
    }
}
