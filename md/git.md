git 기초

## 0. 준비 사항

* [git bash 다운](https://gitforwindows.org/) https://gitforwindows.org/
  * bash 쉘을 통해 git을 활용하기 위한 CLI 제공
  * source free, github desktop 등을 통해 GUI 제공

## 1. 로컬 저장소 활용하기

### 1. 저장소 초기화

```bash
$ git init
Initialized empty Git repository in C:/Users/student/Desktop/til/.git/
```

* 저장소(repository)를 초기화 하면, `.git`폴더가 해당 디렉토리에 생성
* `bash`창에서는 `(master)`라고 표기된다.
  * 현재 `branch`가 `master branch`라는 의미

### 2. add - staging area

> git 으로 관리되는 파일들은 working dir, stagig area, commit  단계를 거쳐 `History`에 저장된다.

```bash
$ git add a.txt # 파일명
$ git add images/ # 폴더명
$ git add . # 현재 디렉토리의 모든 파일
```



### 3. commit

> 커밋은 코드의 이력을 남기는 과정이다.

```bash
$ git commit -m {메세지}
$ git commit -m 'markdown basic .dm file upload'
[master (root-commit) fe99878] markdown basic .dm file upload
 3 files changed, 120 insertions(+)
 create mode 100644 git.md
 create mode 100644 markdown_basic.md
 create mode 100644 src/image/googlelogo_color_92x30dp.png
```

* 일관된 양식으로 `commit message` 작성해서 모두가 알기 쉽게 한다.
* `history` 확인을 위해서는 아래의 명령어를 활용한다.

```bash
$ git log
commit fe99878fb9365dd08fa409457bcea1fdfdb6f0bc (HEAD -> master)
Author: vz4repo <50684258+vz4repo@users.noreply.github.com>
Date:   Mon Dec 16 14:25:34 2019 +0900

    markdown basic .dm file upload
```

```bash
$ git status
On branch master
nothing to commit, working tree clean
```



## 2. 원격 저장소 활용하기
> 원격 저장소(Remote Repository)를 제공하는 서비스는 다양하게 존재한다. 해당 문서는 github를 기준으로 한다.

### 0. 준비하기

github에서 `repository` 생성

### 1. 원격 저장소 설정

```bash
$ git remote add origin {user_url}

$ git remote add origin https://github.com/vz4repo/til.git

$ git push -u origin master
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (7/7), 5.00 KiB | 2.50 MiB/s, done.
Total 7 (delta 0), reused 0 (delta 0)
To https://github.com/vz4repo/til.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

* 본인의 저장소 url을 넣는다.
* 원격저장소(`remote`)로 {`user_url`}을 `origin`이라는 이름으로 추가(`add`)한다.
* 계정의 원격 저장소 목록 보기

```bash
$ git remote -v
origin  https://github.com/vz4repo/til.git (fetch)
origin  https://github.com/vz4repo/til.git (push)
```

### 2. push

```bash
$ git push origin master
Everything up-to-date
```

* 설정된 원격 저장소(`origin`)으로 최종적으로 push.

* `add` `commit`으로 로컬저장소에 저장하고 `push`로 업로드.