# 끝말잇기 게임을 해 봅시다.



## 준비단계

### <팀장>

#### 1단계

1. wordchain 폴더 만들기
2. wordchain 폴더 git init

3. 끝말잇기의 규칙과 첫 제시어를 쓰고 wordchain 폴더에 "README.md"로 저장
4. `add`, `commit` 하기
5. Github에 wordchain repository 만들기
6. `remote add`, `push` 해서 Github에 넣기

---

#### 2단계

1. 권한주기

   1. wordchain repository에서 setting

   2. setting에서 collaborators

   3. 팀원 아이디나 이메일 넣고 추가
   4. 팀원은 이메일로 허락 메일이 옴. 그걸로 수락하기



### <팀원>

#### 1단계

1. 팀장의 wordchain 주소를 받아서 `git clone`으로 wordchain 가져가기 
2. "README.md" 열어서 끝말잇기 이어가기
3. 바꾼 "README.md" `add`, `commit` 하기
4. `push` 하기
   - `git push origin master` 하면 오류 뜸
   - `clone`은 누구나 할 수 있지만 `push`는 아무나 내 Github을 바꾸게 하면 안되기 때문에 팀원에게 바꿀 수 있도록 권한을 줘야함

---

#### 2단계

1. 받은 이메일로 (팀장이 준 권한) 권한 받기





## 게임시작

서로 번갈아가면서 

`git pull origin master` 로 받고

`git add README.md`, `git commit -m "메세지"`, `git push origin master`로 올리는 걸 반복해서 30개의 끝말잇기를 해보자!

