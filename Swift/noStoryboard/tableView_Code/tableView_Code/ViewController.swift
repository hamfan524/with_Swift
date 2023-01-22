//
//  ViewController.swift
//  tableView_Code
//
//  Created by 최동호 on 2023/01/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // tableView 생성
    var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
        return tableview
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        autoLayout()
        
        // autoHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    private func autoLayout(){
        self.view.addSubview(tableView)
            
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self.view)
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell()}
    
        cell.myLabel.text = "Hi"
        return cell
    }
    
    
    
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable
{
    //update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    //makeUI
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
 
}

struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .ignoresSafeArea()
            .previewDisplayName("iPhone 14 Pro")
    }
    
}

#endif
