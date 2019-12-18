# CLI

- `code .` : vs code 열림



# Branch 협업 (Git Flow)

### 팀장

1. dir 생성 & git 시작 

2. `code .`으로 VS code 열기

3. VS code에서 팀 소개 파일 "README.md" 만들기

   - <README.md>

     **# 팀 소개페이지 만들기** 

     팀소개 설명서 

     

     **### 1. 팀 설명** 

     \- 팀명 : ~~

     \- 팀원 : ~~

4. VS code에 파일 "index.html" 만들기

5. Github에 올리기

6. 팀원에게 권한 주기 : setting > collaborators > 팀원 아이디/이메일

   - 권한을 줄 때 master branch에는 push 못하게 하는 등 제한을 줄 수 있다.
   - 현업에서는 직급과 실력에 따라 접근 가능한 branch를 다르게 해서 문제 발생이 일어날 가능성을 최대한 낮춘다.
   - 또한 팀장 포함 모든 사람들이 master에는 push 하지 못하게 하고, 다른 branch에서 코딩한다. 그리고나서 branch를 통으로 push하고 검토를 여러번 거치고 나서, Github에서 merge를 한다.
     - 현업과 비슷한 환경을 주기 위해 이 실습에서 팀원/팀장은 master branch에 push 할 수 없다.

### 팀원

1. home dir에 clone
2. `code .`으로 VS code 열기

---

### 팀원

1. `git branch feature/home` 로 새 branch 만들기
2. feature/home branch로 이동
3. 팀원은 index.html으로 README.md의 내용을 html로 만든다.
   - README.md는 절대 건들지 말 것!

4. `git push origin feature/home` : Github에 branch 채로 push 한다.
5. Github에서 merge request를 보낸다.
6. 왼쪽에 'Reviewers' 탭을 통해 팀장님께 리뷰 요청을 보낸다.
7. 팀장님의 리뷰를 보고 답장하면서 코드를 고치면서 Merge pull request를 해주실 때 까지 기다린다.
   - 현업에서는 팀장이 merge를 하기에 팀원에게는 Merge pull request 버튼이 보이지 않는다.
8. "pull requests" 탭의 "files changed"에서 팀장님의 코멘트를 볼 수 있다.

### 팀장

1.  `git branch feature/desc` 로 새 branch 만들기

2. feature/desc branch로 이동

3. README.md 에 팀 프로젝트에 관한 내용을 쓴다.

   - index.html는 절대 건들지 말 것!

   - <README.md>

     **# 팀 소개페이지 만들기** 

     팀소개 설명서 

     

     **### 1. 팀 설명** 

     \- 팀명 : ~~

     \- 팀원 : ~~

     

4. `git push origin feature/des` : Github에 branch 채로 push 한다.
5. Github에 들어가면 "add your review" 버튼이 생기고, 매 코드 줄마다 코멘트를 달 수 있다.
6. 코멘트를 주고받고선 완성되었다고 생각되면 merge하고 delete branch까지 한다.



오픈소스 contribution

오픈소스에 기여하기 좋은 방법은 새 버전이 나오면 빠르게 번역해서 올리는 것

이런 스펙이 생기면 이미 취업...



# Fork-PR(Github Flow)

> 권한이 없는 경우에도 코드를 바꾸고 싶을 때
>
> 오픈소스의 경우

0. 남의 코드의 경우 clone은 되지만 push는 안된다.

1. 원하는 코드를 찾으면 "Fork"를 누른다.

![image-20191218131101489](06-1_git flow.assets/image-20191218131101489.png)

2. Fork를 누르면 다른 사람 원격 저장소의 repository 통으로 내 원격 저장소에 복사한다. 그래서 이건 내 원격 저장소이니 push가 된다.

![image-20191218131304132](06-1_git flow.assets/image-20191218131304132.png)

 그래서 내 아이디 밑에 주소를 보면 `내 아이디/repository명` 이 되어있다.

3. Fork로 복사한 내 repository 를 clone한다.

4. 바꾸고 싶을 것을 바꾸고 나서 내 꺼에 push한다.

5. "pull request"로 병합 요청을 한다.

   <img src="06-2_github flow.assets/image-20191218132916638.png" alt="image-20191218132916638" style="zoom:150%;" />

   

![image-20191218133016716](06-1_git flow.assets/image-20191218133016716.png) 

- 받는 사람과 보낸 사람 확인

6. 병합 요청을 받은 코드 주인이 병합을 하면 코드 변경 성공!