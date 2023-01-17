# SnapKit 라이브러리
>autolayout을 짧은 코드로 구현할 수 있게 도와주는 라이브러리입니다.

## SnapKit 장점
SnapKit을 사용하지 않은 코드
```Swift
self.view.addSubview(tableView)
self.view.backgroundColor = .white
tableView.backgroundColor = .white
tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
tableView.translatesAutoresizingMaskIntoConstraints = false
tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```
SnapKit을 사용한 코드
```Swift
self.view.addSubview(tableView)
self.view.backgroundColor = .white
tableView.backgroundColor = .white
tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
tableView.snp.makeConstraints { make in
    make.top.left.right.bottom.equalToSuperview()
}
```
많이 줄어든 코드를 확인할 수 있습니다.  
사용해 보면서 느낀 가장 큰 장점은 동일한 constraints를 여럿이 묶어서 한 번에 설정할 수 있다는 것입니다.  
그리고 또 다른 장점은 매번 코드 베이스로 UI를 구현할 때, 정말 귀찮으면서도 빠지면 에러를 불러일으키는 ```translatesAutoresizingMaskIntoConstraints = false``` 이 코드를 대신해주기 때문에 상당히 편리합니다.

## SnapKit 설치
>[SnapKit Git주소](https://github.com/SnapKit/SnapKit)의 installation 파트를 참고하면 됩니다.  
CocoaPods, Carthage, Swift Package Manager로 설치할 수 있습니다.

## SnapKit 사용법
사용법은 엄청 쉽고 간단합니다. 예시로 나와 있는 코드입니다.
UIView인 box를 superView로부터 20의 padding을 주는 코드입니다.
```Swift
import SnapKit
let box = UIView()
superview.addSubview(box)

box.snp.makeConstraints { (make) -> Void in
    make.top.equalTo(superview).offset(20)
    make.left.equalTo(superview).offset(20)
    make.bottom.equalTo(superview).offset(-20)
    make.right.equalTo(superview).offset(-20)
}
```
또는 더 줄여서도 작성 가능합니다.
```Swift
let box = UIView()
superview.addSubview(box)

box.snp.makeConstraints { (make) -> Void in
    make.edges.equalTo(superview).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
}
```
`NSLayoutConstraint`를 통해서 `AutoLayout`을 설정하는 것에 비해서 코드가 대폭 줄어든 것을 볼 수 있습니다.

## Equal로 처리하는 것만 있는 것은 아니다 ( Not all things are created equal)
- ```.equalTo```의 경우는 ```NSLayoutConstraint.Relation.equal```와 동일
- ```.lessThanOrEqualTo```의 경우는 ```NSLayoutConstraint.Relation.lessThanOrEqual```와 동일
- ```.greaterThanOrEqualTo```의 경우는 ```NSLayoutConstraint.Relation.greaterThanOrEqual```와 동일  

위와 같이 "동일", "작거나 동일", "크거나 동일" 세 가지의 식을 만들어 줄 수 있습니다.

## View 속성

<img width="600" alt="1f" src="https://user-images.githubusercontent.com/37105602/212678288-4436ca56-82b2-42a4-9970-2af49cba5898.png">

위에서 소개한 것들을 종합해서 ```view.left```가 ```label.left```보다 크거나 같을 경우에는 아래와 같이 코드를 작성하면 됩니다.
```Swift
// 이 두개는 같은 코드입니다.
make.left.greaterThanOrEqualTo(label)
make.left.greaterThanOrEqualTo(label.snp.left)
```

## Strict Checks
다른 뷰들과의 비교 외에 상수로도 설정가능합니다.
아래와 같이 너비와 높이 값을 상수를 통해 설정할 수 있습니다.
```Swift
// width >= 200 && width <= 400
make.width.greatherThanOrEqualTo(200)
make.width.lessThanOrEqualTo(400)
```
하지만, AutoLayout의 경우 left, right, centerY 등등과 같은 alignment 설정에서는 constant Value를 사용하지 못합니다.
만약에 주게 될때는 superView에 대한 설정으로 인식됩니다.
```Swift
// creates view.left <= view.superview.left + 10
make left.lessThanOrEqualTo(10)
```

다음과 같이 구조를 설정할 수도 있습니다.
```Swift
make.top.equalTo(42)
make.height.equalTo(20)
make.size.equalTo(CGSize(width: 50, height: 100))
make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
make.left.equalTo(view).offset(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
```

## 우선순위(Learn to prioritize)
> **.priority**는 특정 설정에 대한 우선순위를 지정해줄 수 있습니다.

Priority는 constraint chain 뒤쪽에서 설정해줄 수 있습니다.
```Swift
make.top.equalTo(label.snp.top).priority(600)
```
우선순위 shortcuts(바로가기)도 사용가능합니다. **.low, .medium, .high, .required**
```Swift
make.top.equalTo(label.snp.top).priority(.medium)
```

## Composition, composition, composition
위에서 알려준 메서드들로 하나씩 설정할 수도 있지만 한꺼번에 설정해줄 수도 있습니다.
### edges
```Swift
// make top, left, bottom, right equal view2
make.edges.equalTo(view2)

// make top = superview.top + 5, left = superview.left + 10,
//      bottom = superview.bottom - 15, right = superview.right - 20
make.edges.equalTo(superView).inset(UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 15))
```

### size
```Swift
// make width and height greater than or equal to titleLabel
make.size.greaterThanOrEqualTo(titleLabel)

// make width = superview.width + 100, height = superview.height + 100
make.size.equalTo(superview).offset(100)
```

### center
```Swift
// make centerX and centerY = button1
make.center.equalTo(button1)

// make centerX = superview.centerX + 5, centerY = superview.centerY + 5
make.centerequalTo(superview).offset(5)
```

그리고 가독성을 높이기 위해 뷰 속성을 연결할 수도 있습니다.
```Swift
// All edges but the top should equal those of the superview
make.left.right.bottom.equalTo(superview)
make.top.equalTo(otherView)
```

## Hold on for dear life
>View를 애니메이션화 시키거나 제거하거나 바꾸기 위해서는 기존 Constraint를 수정해야 하는 경우가 있습니다.  
**SnapKit**에서는 제약 조건을 업데이트 하기 위한 몇 가지 다른 접근 방식이 있습니다.

### 1. 참고 문헌 (References)  
Constraint 설정 결과를 지역 변수 또는 클래스 속성에 할당하여 특정 제약 조건의 참조를 유지할 수 있습니다. 여러 제약 조건을 배열에 저장하여 참조할 수도 있습니다.
```Swift
var topConstraint: Constraint? = nil

...

// when making constraints
view1.snp.makeConstraints { (make) -> Void in
  self.topConstraint = make.top.equalTo(superview).offset(padding.top).constraint
  make.left.equalTo(superview).offset(padding.left)
}

...
// then later you can call
self.topConstraint.deactivate()

// or if you want to update the constraint
self.topConstraint.updateOffset(5)
```

### 2. snp.updateConstraints  
Constraint를 변경해줄 때는 ```snp.makeConstraints```를 대신하여 ```snp.updateConstraints```를 사용합니다.

```Swift
// this is Apple's recommended place for adding/updating constraints
// this method can get called multiple times in response to setNeedsUpdateConstraints
// which can be called by UIKit internally or in your code if you need to trigger an update to your constraints
override func updateConstraints() {
    self.growingButton.snp.updateConstraints { (make) -> Void in
        make.center.equalTo(self);
        make.width.equalTo(self.buttonSize.width).priority(250)
        make.height.equalTo(self.buttonSize.height).priority(250)
        make.width.lessThanOrEqualTo(self)
        make.height.lessThanOrEqualTo(self)
    }
    
   // according to Apple super should be called at end of method
	 super.updateConstraints()
}
```

### 3. snp.remakeConstraints
```snp.remakeConstraints```는 ```snp.makeConstraints```와 비슷합니다. 그러나 remake를 할 경우에는 SnapKit에 의해서 이제껏 설정해 둔 모든 Constraint가 없어지니 조심해서 사용해야 됩니다.

```Swift
func changeButtonPosition() {
  self.button.snp.remakeConstraints { (make) -> Void in 
    make.size.equalTo(self.buttonSize)

    if topLeft {
      make.top.left.equalTo(10)
    } else {
      make.bottom.equalTo(self.view).offset(-10)
      make.right.equalTo(self.view).offset(-10)
    }
  }
}
```
## Snap view to safeAreaLayoutGuide
```iOS 11``` 부터는 ```topLayoutGuide```와 ```bottomLayoutGuide```는 더 이상 사용되지 않습니다. ```safeAreaLayoutGuide```를 사용해야합니다.

```Swift
import SnapKit

class MyViewController: UIVewController {
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
           make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }

}
```

## 간편한 디버그 (Debug with ease)
>코드로든 스토리보드로든 레이아웃을 짤 때 레이아웃이 맞지 않아 콘솔에 오류가 생기는 경우가 있습니다.  
이미지의 주소라던지 각 객체의 주소가 `0x000ff110` 이런식으로 나오기 때문에 이게 어떤 객체를 말하는건지 파악하기 힘든 경우가 많습니다.  
`.labled`를 사용하면 이후 콘솔창에 뭐가 문제인지 확인하기 편해집니다.

```Swift
button.snp.makeConstratins { (make) -> Void in
  make.top.equalTo(otherView).labeled("buttonViewTopConstraint")
}
```
`.labled`를 위와 같이 constraint 끝에 추가 할 수 있습니다.

아래와 같이 레이아웃이 충돌이 났을 때, 콘솔창에 어디서 생긴 문제인지 로그로 나타나기 때문에 확인하기 편해집니다.  
<img width="600" alt="1f" src="https://user-images.githubusercontent.com/37105602/212883588-ef43b011-a744-4a38-84c1-a90cec6fa44f.png">

보통 breakpoint를 잡거나 레이아웃 에러를 잡아주는 사이트 등에 들어가 파악하는 경우도 많지만  
스냅킷에서는 `.labled` 기능을 사용하여 편리하게 확인 가능합니다.  
**간단하게 얘기하면 각 객체에 이름을 달아줘 디버그할 때 쉽게 찾을 수 있다는 장점이 있습니다.**
## Reference
[SnapKit Git주소](https://github.com/SnapKit/SnapKit)  
[SnapKit 공식문서](https://snapkit.github.io/SnapKit/docs/)