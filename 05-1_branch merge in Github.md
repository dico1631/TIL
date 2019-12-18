# Github에서 merge하는 방법

1. `git push origin [branch명]`으로 새 branch를 Githib에 넣는다.
2. Github의 해당 repository에 노란색 메세지와 같이 생긴 "Copare & pull request" 라는 버튼을 누른다.

![image-20191217164028485](C:/Users/student/TIL/05_branch.assets/image-20191217164028485.png)



3. 메세지를 쓰고 "Creat pull request" 버튼을 누른다
   - `base: master` : 병합 할 아이는 master branch
   - `compare: test` : 비교 되고 , 병합 될 아이는 text branch

![image-20191217164133558](C:/Users/student/TIL/05_branch.assets/image-20191217164133558.png)



4. request를 받은 사람은 "pull request" 탭에서 받은 request를 확인 가능하며, 병합을 원하면 "Merge pull request"를 클릭해서 병합 완료
   - 초록 네모는 Github가 자체적으로 병합이 가능한지 판단하고 자동 병합이 가능하다고 알려주는 것
   - 자동 병합이 안되는 경우는 다른 화면이 나올 것

![image-20191217164320451](C:/Users/student/TIL/05_branch.assets/image-20191217164320451.png)



### Github의 tab 설명

- code탭 : 코드 보는 곳

- issue탭 : 코드 주인에게 comment 달기

- pull request탭 : 다른 사람이 내 코드 중 변경하고 싶은 부분이 있어서 수정 후 병합을 요청하면, 그 사람의 병합 요청을 볼 수 있는 곳