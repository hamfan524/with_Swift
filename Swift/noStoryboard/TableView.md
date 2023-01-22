# 테이블뷰 (TableView) - 코드로 구현

리스트를 보여주기 가장 기본적인 구조인 테이블 뷰를 코드로 구현하는 방법입니다.  
스토리보드 없이 작업하기 위한 기본적인 설정을 완료한 상태에서 진행합니다.
- [noStoryboard 프로젝트 설정](./noStoryboard.md)
- [SnapKit](./SnapKit.md)

## 1. tableView 만들기

tableView를 먼저 생성합니다.  
tableView에 따로 설정해줄게 없고 무조건 존재할 거라면 강제 옵셔널로 처리해주어도 괜찮습니다.
```Swift
var tableView: UITableView!
```
저는 register를 통해 customCell인 MyTableViewCell을 등록하기 위해 변수로 만들겠습니다.
```Swift
// tableView 생성
var tableView: UITableView = {
    let tableview = UITableView()
    tableview.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
    return tableview
}()
```

## 2. tableView 추가 설정 및 오토 레이아웃
viewDidLoad에 tableView의 delegate와 datasource 대리자를 위임해줍니다.  
MyTableViewCell이라는 identifier을 가진 MyTableViewCell 클래스를 tableView에 등록합니다.

`autoHeight` 부분은 custom으로 cell의 크기를 유동적으로 변환시키고 싶을 때 추가해줍니다.
```Swift
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        autoLayout()
        
        // autoHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
```
autoLayout 함수를 만들고 그 안에 TableView의 constraint를 조정해줍니다.  
constraint는 [SnapKit](./SnapKit.md)라이브러리를 이용하여 top, bottom, leading, trailing을 모두 0으로 설정한 것과 같게 만들어줍니다.
```Swift
    private func autoLayout(){
        self.view.addSubview(tableView)
            
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self.view)
        }
    } 
```
## 3. tableView CustomCell 생성
ViewController에서 customCell을 register할 때 사용할 identifier를 선언합니다.  
identifier를 선언할 시엔, 오탈자 발생을 줄여줍니다.

저는 label 하나만 변수로 선언하겠습니다.

![스크린샷 2023-01-22 오후 8 14 28](https://user-images.githubusercontent.com/37105602/213912954-a9094c5b-5d45-4e63-94c3-3e35c40e033e.png)

label.textColor 옆에 초록색 네모는 colorLiteral로 사용법은 `#colorLiteral(` 을 입력하고 return을 입력하면 나옵니다.

![스크린샷 2023-01-22 오후 8 20 00](https://user-images.githubusercontent.com/37105602/213913114-595ef3c2-9a0b-475d-9e9d-33407b5d7ef4.png)

이렇게 색상 선택할 때 직관적으로 선택할 수 있어 유용합니다.

## 4. tableView CustomCell 설정
먼저 코드로 cell을 만들면 init을 생성해줘야합니다.  
인터페이스 빌더에서는 자동으로 초기화를 해주지만, 코드로 구현할 때는 인터페이스 빌더를 사용하지 않기 때문입니다. 

UITableViewCell 안에서 addSubview를 할 때는 contentView에 addSubview를 하게됩니다.  
label의 오토 레이아웃을 잡아주면 customCell은 끝입니다.
![스크린샷 2023-01-22 오후 8 26 00](https://user-images.githubusercontent.com/37105602/213913316-6a39c8ac-0a9a-4810-a3bb-0302306606b0.png)

## 5. UITableViewDelegate와 UITableViewDataSource 프로토콜 채택

UITableViewDelegate와 UITableViewDataSource를 채택합니다.  
그 후 필수적으로 `numberOfRowsInSection`, `cellForRowAt`을 구현해야합니다.

`numberOfRowsInSection`에는 각 section에 몇개의 row를 노출시킬 것인지 설정하는 곳입니다.
현재 section은 1개이기 때문에 나타내고 싶은 row 갯수만 작성합니다.

`cellForRowAt`에는 cell마다 나타내고싶은 cell의 class를 작성해줍니다.

```Swift
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
```

## 6. 세팅 완료
코드로 기본적인 tableView 설정 완료입니다.  
그 밖에 셀의 선택, 삭제, section 생성 등은 다른 부가적인 기능 추가를 통해 사용가능합니다.
![스크린샷 2023-01-22 오후 8 36 20](https://user-images.githubusercontent.com/37105602/213913763-678477a8-e063-40b4-a653-7fe4aab29752.png)

## Reference

[Sample 코드](./tableView_Code)










