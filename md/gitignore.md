# Gitignore

> git을 통한 프로젝트 시작시 반드시 설정

## 활용법

`.gitignore` 파일을 생성 후 git으로 관리하지 않을 파일의 목록을 작성한다.

```
*.xlsx # 확장자가 xlsx인 모든 파일
test/ # test 폴더
a.txt # 특정 파일
```

* IDE(Eclipse, VScode, Visual Studio) 설정과 관련된 내용, 혹은 언어별 임시 파일, OS 관련 파일 등 프로젝트와 무관한 소스코드들.
* 해당 환경을 https://gitignore.io에서 검색하여 설정.
  e.g. `eclipse`, `java`, `windows`, `vscode`...

