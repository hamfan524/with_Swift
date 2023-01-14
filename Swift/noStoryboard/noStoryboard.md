# noStoryboard 프로젝트 세팅
>**스토리보드 없이, 코드로만 UI를 구현**하기 위해 간단하게 설정하는 방법

## 📌프로젝트 생성

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212392172-af4da35b-48b2-490c-8da4-9c2c3148dae1.png">

스토리보드 없이 작업할 프로젝트를 생성합니다. 

## 📌Main.storyboard 삭제

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212392542-6cf7ebdc-6a68-460c-8853-b9e6a55b7d47.png">

이제 필요 없는 Main.storyboard를 삭제해주겠습니다.<br>
마우스 우클릭으로 <span style='background-color: #f6f8fa'>**Move to Trash**</span>를 클릭하거나<br>
Main.storyboard를 클릭 후 <span style='background-color: #f6f8fa'>**command + delete**</span>를 동시에 눌려줍니다.

<img width="400" alt="1f" src="https://user-images.githubusercontent.com/37105602/212392594-eda9db08-30d1-4be7-b371-98e6e077d7db.png">

<span style='background-color: #f6f8fa'>**Move to Trash**</span>를 눌러 쓰레기통에 버려줍니다.

## 📌info.plist 설정

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212396285-73979235-6c20-4430-a854-314e416cb78c.png">

<span style='background-color: #f6f8fa'>**info.list**</span>에서 <span style='background-color: #f6f8fa'>**StoryboardName**</span>에  <span style='background-color: #f6f8fa'>**Main**</span>으로 되어 있을텐데 여기서 <span style='background-color: #f6f8fa'>**-**</span> 버튼을 눌러 삭제해줍니다.

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212392773-2c22a629-0583-48ab-ac0e-ef2bdd7caa35.png">

이렇게 완전히 없애줍니다.

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212392914-997c3666-c09e-4f4e-b12e-9ad592e2b057.png">

그 후 **noStoryboard_Sample**에 들어가서 (Xcode 14버전 이상)<br>
**TARGETS**에 **Deployment Info**안에 있는 **Supports multiple windows**를 클릭합니다.

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393147-c6402f4f-8e7f-4dbf-83d9-c342a57ced64.png">

**Main storyboard file base name**의 **Value**가 **Main**으로 되어있을텐데 그걸 지워줍니다.

## 📌SceneDelegate 설정

Scene 즉 화면과 관련된 부분을 담당하고 있는 SceneDelegate로 가줍니다.

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393196-f3a52130-87fe-4693-acae-78c089cb5c42.png">

15째 줄에 scene이라는 메서드를 확인 할 수 있는데 여기서 내용을 변경해줍니다. (iOS 13버전 밑에선 AppDelegate에서 작업해야합니다.)

```Swift
guard let _ = (scene as? UIWindowScene) else { return }
```
일단 기존에 19번째 줄에 있는 이 코드는 주석처리하거나 지워줍니다.

```Swift
guard let windowScene = (scene as? UIWindowScene) else { return }
        
window = UIWindow(frame: UIScreen.main.bounds) // SceneDelegate의 프로퍼티에 설정
        
let viewController = ViewController() // 처음 보일 view controller
        
window?.rootViewController = viewController     // 위에서 만든 view controller를 첫 화면으로 띄우기
        
window?.makeKeyAndVisible()     // 화면에 보이게끔
window?.windowScene = windowScene
```
그 후 이 코드를 복붙해서 넣어줍니다.

<img width="600" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393256-629e2d3f-ebc1-4bcb-ab16-daa9cebe0588.png">

이제 설정은 완료입니다.

## 📌빌드

이제 설정이 다 되었으니 빌드를 해봅니다.

<img width="600" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393312-c9fda4c8-e04d-4f52-b637-cd7817a44d08.png">

배경색을 오렌지색으로 바꾼 뒤에 빌드해보겠습니다.

<img width="500" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393392-da8953ed-fe74-4a86-89fa-d76ef48f50d8.png">

스토리보드 없이 UI를 구현할 수 있는 세팅이 완료된걸 확인할 수 있습니다.

## 📌SwiftUI로 미리보기 기능 사용하기

개발하는 정대리님의 강의를 통해 알게된 내용입니다.<br>
일반적으로 코드를 작성할때마다 빌드하면서 확인하는 방법은 번거롭기 때문에 **SwiftUI**를 빌려와서 미리보기하는 기능을 사용하겠습니다.

```Swift
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
```
SwiftUI에서 UIViewController를 렌더링하는 코드입니다. 이걸 추가해준 뒤 **option+command+return**을 눌려줍니다.

<img width="800" alt="1f" src="https://user-images.githubusercontent.com/37105602/212393454-4a5593e9-5b3e-491d-97c8-6f4705ad0183.png">

오른쪽에 미리보기가 생성되는걸 확인 할 수 있습니다.

## 📌Reference
[noStoryboard_Sample 코드](./noStoryboard_Sample/noStoryboard_Sample)
