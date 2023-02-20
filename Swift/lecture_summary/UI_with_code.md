tags : #ios #ui #uikit #autoScail

# 코드로 UI 작성
- 제목

```swift
let emailTextFieldView: UIView = { 
	let view = UIView()
	view.backgroundColor = UIColor.darkGray
	view.layer.cornerRadius = 10
	view.layer.masksToBounds = true
	return view
} ()
// lazy var 로 설정한 후 아래의 addsubview를 가져와,
// self.view.addSubview(view)를 해 줄 수도 있다.

// viewDidLoad

func makeUI() {
	view.addSubview(emailTextFieldView)
	// 자동으로 프레임 기준으로 올라가는 것을 꺼주는 코드. 반드시 설정해야 한다.
	emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
	// 오토 레이아웃 코드
	emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
	emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
  emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
}
```

[[note_list_ios]]