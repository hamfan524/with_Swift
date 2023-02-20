tags : #ios #button #ui #uikit #버튼  

# Contents
1. 코드를 통해 (넘어갈 화면의 코드 파일이 존재해야 가능)

```swift
let firstVC = FirstViewController()
firstVC.modalPresentationStyle = .fullScreen
firstVC.someString = "내부 변수로 데이터 전달 가능"
firstVC.mailLabel.text = "연결화면이 스토리보드로 만들어졌으면 이 줄의 방식은 불가능"
present(firstVC, animated: true, completion: nil)
````
- 코드로 만들었을 때만 위처럼 인스턴스를 만드는 것이 가능하다.
	- view위의 모든 UI들이 메모리에 올라갈 수 있기 때문
	- (storyboard로 만든 화면의 UI는 힙 영역에 올라간다.)

2. 스토리보드로 만든 화면으로 넘어갈 때
```swift
if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
	secondVC.someString = "내부 변수로 데이터 전달 가능"
	// seconeVC.mailLabel.text = "연결화면이 스토리보드로 만들어졌으면 이 줄의 방식은 불가능"
	present(secondVC, animated: true completion: nil)
}
```
- guard let을 써도 되고, if let 대신 let과 as!를 사용해서 진행해도 된다. (스토리보드가 없는 경우가 거의 없으므로...)
- UIViewController에 저장된 storyboard라는 변수를 사용하는 것이다.
- withIdentifier에 들어가는 string은 연결할 스토리보드의 id와 일치해야 한다.(별도 설정 필요)
- 받아온 스토리보드를 SecondViewController 타입으로 캐스팅해주는 것이다.
[[note_list_ios]]