# Github로 블로그를 만들어보자



1. Bootstrap templet에서 템플릿을 다운
2. 압축 풀기
3. VS code에서 열기
4. Girhub에서 아래 그림처럼 `[본인아이디].github.io` 이름으로 새 repository 만들기
   - 반드시 repository 이름 지키기!



5. VS code에서 Gitbash 사용하는 법

   - terminal > new terminal > dropbox " 1.powershell" > select default shell > gitbash > 휴지통으로 버림 > terminal > new terminal

6. git push 하기

   ```shell
   #$ 옆에 있는 한 줄이 쓴 것, 나머지는 나온 결과
   h-pages
   $ git init
   Initialized empty Git repository in C:/Users/student/Desktop/startbootstrap-resume-gh-pages/.git/
   
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git add .
   warning: LF will be replaced by CRLF in .browserslistrc.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in .gitignore.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in .travis.yml.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in LICENSE.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in README.md.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in css/resume.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in css/resume.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in gulpfile.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in index.html.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in js/resume.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in js/resume.min.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in package-lock.json.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in package.json.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_bootstrap-overrides.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_global.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_mixins.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_nav.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_resume-item.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/_variables.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in scss/resume.scss.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap-grid.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap-grid.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap-reboot.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap-reboot.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/css/bootstrap.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/js/bootstrap.bundle.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/js/bootstrap.bundle.min.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/js/bootstrap.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/bootstrap/js/bootstrap.min.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/all.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/all.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/brands.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/brands.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/fontawesome.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/fontawesome.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/regular.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/regular.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/solid.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/solid.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/svg-with-js.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/svg-with-js.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/v4-shims.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/css/v4-shims.min.css.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/webfonts/fa-brands-400.svg.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/webfonts/fa-regular-400.svg.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/fontawesome-free/webfonts/fa-solid-900.svg.
   uery.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/jquery/jquery.min.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/jquery/jquery.slim.js.
   The file will have its original line endings in your working directory
   warning: LF will be replaced by CRLF in vendor/jquery/jquery.slim.min.js.
   The file will have its original line endings in your working directory
   
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git status
   On branch master
   
   No commits yet
   
   Changes to be committed:
     (use "git rm --cached <file>..." to unstage)
           new file:   .browserslistrc
           new file:   .gitignore
           new file:   .travis.yml
           new file:   LICENSE
           new file:   README.md
           new file:   css/resume.css
           new file:   css/resume.min.css
           new file:   gulpfile.js
           new file:   img/profile.jpg
           new file:   index.html
           new file:   js/resume.js
           new file:   js/resume.min.js
           new file:   package-lock.json
           new file:   package.json
           new file:   scss/_bootstrap-overrides.scss
           new file:   scss/_global.scss
           new file:   scss/_mixins.scss
           new file:   scss/_nav.scss
           new file:   scss/_resume-item.scss
           new file:   scss/_variables.scss
           new file:   scss/resume.scss
           new file:   vendor/bootstrap/css/bootstrap-grid.css
           new file:   vendor/bootstrap/css/bootstrap-grid.css.map
           new file:   vendor/bootstrap/css/bootstrap-grid.min.css
           new file:   vendor/bootstrap/css/bootstrap-grid.min.css.map
           new file:   vendor/bootstrap/css/bootstrap-reboot.css
           new file:   vendor/bootstrap/css/bootstrap-reboot.css.map
           new file:   vendor/bootstrap/css/bootstrap-reboot.min.css
           new file:   vendor/bootstrap/css/bootstrap-reboot.min.css.map
           new file:   vendor/bootstrap/css/bootstrap.css
           new file:   vendor/bootstrap/css/bootstrap.css.map
           new file:   vendor/bootstrap/css/bootstrap.min.css
           new file:   vendor/bootstrap/css/bootstrap.min.css.map
           new file:   vendor/bootstrap/js/bootstrap.bundle.js
           new file:   vendor/bootstrap/js/bootstrap.bundle.js.map
           new file:   vendor/bootstrap/js/bootstrap.bundle.min.js
           new file:   vendor/bootstrap/js/bootstrap.bundle.min.js.map
           new file:   vendor/bootstrap/js/bootstrap.js
           new file:   vendor/bootstrap/js/bootstrap.js.map
           new file:   vendor/bootstrap/js/bootstrap.min.js
           new file:   vendor/bootstrap/js/bootstrap.min.js.map
           new file:   vendor/fontawesome-free/css/all.css
           new file:   vendor/fontawesome-free/css/all.min.css
           new file:   vendor/fontawesome-free/css/brands.css
           new file:   vendor/fontawesome-free/css/brands.min.css
           new file:   vendor/fontawesome-free/css/fontawesome.css
           new file:   vendor/fontawesome-free/css/fontawesome.min.css
           new file:   vendor/fontawesome-free/css/regular.css
           new file:   vendor/fontawesome-free/css/regular.min.css
           new file:   vendor/fontawesome-free/css/solid.css
           new file:   vendor/fontawesome-free/css/solid.min.css
           new file:   vendor/fontawesome-free/css/svg-with-js.css
           new file:   vendor/fontawesome-free/css/svg-with-js.min.css
           new file:   vendor/fontawesome-free/css/v4-shims.css
           new file:   vendor/fontawesome-free/css/v4-shims.min.css
           new file:   vendor/fontawesome-free/webfonts/fa-brands-400.eot
           new file:   vendor/fontawesome-free/webfonts/fa-brands-400.svg
           new file:   vendor/fontawesome-free/webfonts/fa-brands-400.ttf
           new file:   vendor/fontawesome-free/webfonts/fa-brands-400.woff
           new file:   vendor/fontawesome-free/webfonts/fa-brands-400.woff2
           new file:   vendor/fontawesome-free/webfonts/fa-regular-400.eot
           new file:   vendor/fontawesome-free/webfonts/fa-regular-400.svg
           new file:   vendor/fontawesome-free/webfonts/fa-regular-400.ttf
           new file:   vendor/fontawesome-free/webfonts/fa-regular-400.woff
           new file:   vendor/fontawesome-free/webfonts/fa-regular-400.woff2
           new file:   vendor/fontawesome-free/webfonts/fa-solid-900.eot
           new file:   vendor/fontawesome-free/webfonts/fa-solid-900.svg
           new file:   vendor/fontawesome-free/webfonts/fa-solid-900.ttf
           new file:   vendor/fontawesome-free/webfonts/fa-solid-900.woff
           new file:   vendor/fontawesome-free/webfonts/fa-solid-900.woff2
           new file:   vendor/jquery-easing/jquery.easing.compatibility.js
           new file:   vendor/jquery-easing/jquery.easing.js
           new file:   vendor/jquery-easing/jquery.easing.min.js
           new file:   vendor/jquery/jquery.js
           new file:   vendor/jquery/jquery.min.js
           new file:   vendor/jquery/jquery.min.map
           new file:   vendor/jquery/jquery.slim.js
           new file:   vendor/jquery/jquery.slim.min.js
           new file:   vendor/jquery/jquery.slim.min.map
   
   
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git commit -m "Creat portpolio"
   [master (root-commit) 38d065b] Creat portpolio
    79 files changed, 72602 insertions(+)
    create mode 100644 .browserslistrc
    create mode 100644 .gitignore
    create mode 100644 .travis.yml
    create mode 100644 LICENSE
    create mode 100644 README.md
    create mode 100644 css/resume.css
    create mode 100644 css/resume.min.css
    create mode 100644 gulpfile.js
    create mode 100644 img/profile.jpg
    create mode 100644 index.html
    create mode 100644 js/resume.js
    create mode 100644 js/resume.min.js
    create mode 100644 package-lock.json
    create mode 100644 package.json
    create mode 100644 scss/_bootstrap-overrides.scss
    create mode 100644 scss/_global.scss
    create mode 100644 scss/_mixins.scss
    create mode 100644 scss/_nav.scss
    create mode 100644 scss/_resume-item.scss
    create mode 100644 scss/_variables.scss
    create mode 100644 scss/resume.scss
    create mode 100644 vendor/bootstrap/css/bootstrap-grid.css
    create mode 100644 vendor/bootstrap/css/bootstrap-grid.css.map
    create mode 100644 vendor/bootstrap/css/bootstrap-grid.min.css
    create mode 100644 vendor/bootstrap/css/bootstrap-grid.min.css.map
    create mode 100644 vendor/bootstrap/css/bootstrap-reboot.css
    create mode 100644 vendor/bootstrap/css/bootstrap-reboot.css.map
    create mode 100644 vendor/bootstrap/css/bootstrap-reboot.min.css
    create mode 100644 vendor/bootstrap/css/bootstrap-reboot.min.css.map
    create mode 100644 vendor/bootstrap/css/bootstrap.css
    create mode 100644 vendor/bootstrap/css/bootstrap.css.map
    create mode 100644 vendor/bootstrap/css/bootstrap.min.css
    create mode 100644 vendor/bootstrap/css/bootstrap.min.css.map
    create mode 100644 vendor/bootstrap/js/bootstrap.bundle.js
    create mode 100644 vendor/bootstrap/js/bootstrap.bundle.js.map
    create mode 100644 vendor/bootstrap/js/bootstrap.bundle.min.js
    create mode 100644 vendor/bootstrap/js/bootstrap.bundle.min.js.map
    create mode 100644 vendor/bootstrap/js/bootstrap.js
    create mode 100644 vendor/bootstrap/js/bootstrap.js.map
    create mode 100644 vendor/bootstrap/js/bootstrap.min.js
    create mode 100644 vendor/bootstrap/js/bootstrap.min.js.map
    create mode 100644 vendor/fontawesome-free/css/all.css
    create mode 100644 vendor/fontawesome-free/css/all.min.css
    create mode 100644 vendor/fontawesome-free/css/brands.css
    create mode 100644 vendor/fontawesome-free/css/brands.min.css
    create mode 100644 vendor/fontawesome-free/css/fontawesome.css
    create mode 100644 vendor/fontawesome-free/css/fontawesome.min.css
    create mode 100644 vendor/fontawesome-free/css/regular.css
    create mode 100644 vendor/fontawesome-free/css/regular.min.css
    create mode 100644 vendor/fontawesome-free/css/solid.css
    create mode 100644 vendor/fontawesome-free/css/solid.min.css
    create mode 100644 vendor/fontawesome-free/css/svg-with-js.css
    create mode 100644 vendor/fontawesome-free/css/svg-with-js.min.css
    create mode 100644 vendor/fontawesome-free/css/v4-shims.css
    create mode 100644 vendor/fontawesome-free/css/v4-shims.min.css
    create mode 100644 vendor/fontawesome-free/webfonts/fa-brands-400.eot
    create mode 100644 vendor/fontawesome-free/webfonts/fa-brands-400.svg
    create mode 100644 vendor/fontawesome-free/webfonts/fa-brands-400.ttf
    create mode 100644 vendor/fontawesome-free/webfonts/fa-brands-400.woff
    create mode 100644 vendor/fontawesome-free/webfonts/fa-brands-400.woff2
    create mode 100644 vendor/fontawesome-free/webfonts/fa-regular-400.eot
    create mode 100644 vendor/fontawesome-free/webfonts/fa-regular-400.svg
    create mode 100644 vendor/fontawesome-free/webfonts/fa-regular-400.ttf
   ompatibility.js
    create mode 100644 vendor/jquery-easing/jquery.easing.js
    create mode 100644 vendor/jquery-easing/jquery.easing.min.js
    create mode 100644 vendor/jquery/jquery.js
    create mode 100644 vendor/jquery/jquery.min.js
    create mode 100644 vendor/jquery/jquery.min.map
    create mode 100644 vendor/jquery/jquery.slim.js
    create mode 100644 vendor/jquery/jquery.slim.min.js
    create mode 100644 vendor/jquery/jquery.slim.min.map
   
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git remote add origin https://github.com/dico1631/dico1631.github.io.git
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git remote -v
   origin  https://github.com/dico1631/dico1631.github.io.git (fetch)
   origin  https://github.com/dico1631/dico1631.github.io.git (push) 
   
   student@M15035 MINGW64 ~/Desktop/startbootstrap-resume-gh-pages (master)
   $ git push origin master
   Enumerating objects: 94, done.
   Counting objects: 100% (94/94), done.  
   Delta compression using up to 8 threads
   Compressing objects: 100% (92/92), done.
   Writing objects: 100% (94/94), 2.16 MiB | 1.19 MiB/s, done.
   Total 94 (delta 17), reused 0 (delta 0)
   remote: Resolving deltas: 100% (17/17), done.
   To https://github.com/dico1631/dico1631.github.io.git
    * [new branch]      master -> master
   ```

   

5. `[본인아이디].github.io` 를 인터넷 주소창에 쳐서 되는지 확인

- 블로그가 안뜨는 이유
  - repository 이름을 위에서 말한대로 만들지 않은 경우
    - repository 지우고 다시하기
  - 받은 템플릿 압축 파일이 깨졌을 때
    - 다시 다운받아서 전부 다시 진행
  - 위의 경우가 다 아닌 경우
    - 파일이 커서 시간이 필요한 경우, 기다리면 됨.



6. VS code 를 가지고 디자인과 내용을 바꿔서 나만의 블로그를 만들기
   - push 해야만 github에 올라가서 다른 사람들도 볼 수 있는 블로그가 됨.
   - 근데 매번 바꾸고 push 하긴 귀찮으니까 alt + b로 실행화면을 확인하고 다 하고나서 push 하기 (alt + b 는 open in broswer을 써야만 작동하는 단축키)