tags : #ios #ui #uikit #화면이동 #view #스토리보드 #storyboard #세그웨이 

# Contents
- 화면이동을 담당하는 객체
- 스토리보드에서 스토리보드로 이동할 때 사용
- present modally 창을 띄운다는 뜻?
- 우측 창을 통해 세그웨이에 identirier를 추가할 수 있다.
<img src="https://user-images.githubusercontent.com/70102600/229506829-0646fe11-157b-40c1-912f-bfc79f9a06c6.png" width="500">---
3. 뷰 컨트롤러끼리 연결한 세그웨이
- control + 드래그 를 이용하여 "두 view controller를 연결하면" 세그웨이(segue)가 된다.
```swift
// 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
        // 스토리보드에 있는 세그웨이가 동작하게 된다.
        // identifier를 잘 맞춰줘야한다
        // sender는 self를 자주 쓰고 nil을 쓸 수도 ㅇㅆ다.
    }
    
    // 아래 코드로 세그웨이를 준비시켜주고 데이터를 전달할 수 있다.
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            // 데이터 전달 (someString 변수는 미리 준비되어 있어야 한다.)
            thirdVC.someString = "세 번째 화면"
        }
    }

// ThirdViewController.swift
	// 이동한 view에서는 dismiss를 활용해 돌아가게 할 수 있다.
	@IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)   
    }
```
---
4. 버튼에서 연결한 세그웨이
- control + 드래그 를 이용하여 "버튼에서 view controller를 연결하면" 세그웨이(segue)가 된다.
- performSegue 함수를 사용하지 않아도 동일한 효과가 난다!
```swift
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toThirdVC" {
			let thirdVC = segue.destination as! ThirdViewController
			// 데이터 전달
			thirdVC.someString = "세 번째 화면"
		}
		// prepare 내에 추가만 해주면 된다.
		if segue.identifier == "toFourthVC" {
			let fourthVC = segue.destination as! FourthViewController
			fourthVC.someString = "네 번째 화면"
		}
	}
```
- 버튼으로 만든 세그웨이는 shouldPerformSegue 함수를 사용하여  segue 실행 여부를 전달 받을 수 있다!

---
<img src="https://user-images.githubusercontent.com/70102600/229507072-ee570043-4ddb-40e4-926d-eda09625ea40.png" width="500">

[[note_list_ios]]
[[present(inter_view_control)]]
