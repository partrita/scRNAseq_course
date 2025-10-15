# 과정에 대하여

오늘날에는 고처리량 시퀀싱(scRNA-seq)을 사용하여 단일 세포에서 게놈 전체의 전사체 데이터를 얻을 수 있습니다. scRNA-seq의 주요 장점은 세포 해상도와 게놈 전체 범위 덕분에 대량 RNA-seq 또는 단일 세포 RT-qPCR과 같은 다른 방법으로는 다루기 어려운 문제를 해결할 수 있다는 것입니다. 그러나 scRNA-seq 데이터를 분석하려면 새로운 방법이 필요하며 대량 RNA-seq 실험을 위해 개발된 방법의 기본 가정 중 일부는 더 이상 유효하지 않습니다.

이 과정에서는 scRNA-seq를 사용하여 해결할 수 있는 몇 가지 질문과 사용 가능한 계산 및 통계 방법에 대해 논의합니다. 이 과정은 케임브리지 대학교 <a href="http://training.csx.cam.ac.uk/bioinformatics/" target="blank">생물정보학 교육 단위</a>를 통해 진행되지만, 이 페이지에 있는 자료는 scRNA-seq 데이터의 계산 분석에 대해 배우고자 하는 모든 사람이 사용할 수 있도록 만들어졌습니다. 이 과정은 매년 두 번 진행되며 여기 자료는 각 행사 전에 업데이트됩니다.

계산 도구의 수는 빠르게 증가하고 있으며 사용 가능한 최신 정보를 파악하기 위해 최선을 다하고 있습니다. 이 과정의 주요 제약 조건 중 하나는 R로 구현되고 합리적으로 빠르게 실행되는 도구를 사용하고 싶다는 것입니다. 또한, 우리 또는 우리의 친구 및 동료가 개발한 방법에 다소 편향되어 있음을 고백합니다.

**:information_source: 현재(2022년 상반기) 이 과정은 적극적으로 업데이트되고 있으며 내용은 추가 공지 없이 크게 변경될 수 있습니다.**

## 웹 페이지

| 홈페이지 | 데이터 |
| ------------- | ------------- |
| https://www.singlecellcourse.org  | https://singlecellcourse.cog.sanger.ac.uk/index.html?shared=data/  |

## 비디오

이 비디오는 2019년 5월 과정(2일) 중에 녹화되었습니다. **내용은 2021년에 있었던 업데이트와 일치하지 않습니다. 새로운 비디오는 준비되는 대로 업로드될 예정입니다.**

| 날짜 | 링크 | 설명 |
| ------------- | ------------- | ------------- |
| **#1** | [https://www.youtube.com/watch?v=thHgPqQpkE4](https://www.youtube.com/watch?v=thHgPqQpkE4&t=2738s) | 강의는 비디오의 **45:38**부터 시작됩니다. 주제: 과정 소개, 단일 세포 RNA-seq 소개, 원시 scRNA-Seq 시퀀싱 데이터 처리, R/Bioconductor 소개, Bioconductor를 사용한 scRNA-seq 분석, 기본 품질 관리(QC) 및 scRNA-seq 데이터셋 탐색. |
| **#2** | [https://www.youtube.com/watch?v=7dQ_pleDO2Y](https://www.youtube.com/watch?v=7dQ_pleDO2Y&t=3436s) | 강의는 비디오의 **57:16**부터 시작됩니다. 주제: 생물학적 분석, Seurat를 사용한 단일 세포 RNA-seq 분석, scRNA-seq 데이터셋 통합, 리소스 |


## 등록

이 링크를 따라 __"단일 세포 RNA-seq 데이터 분석"__ 과정에 등록하십시오:
<a href="http://training.csx.cam.ac.uk/bioinformatics/search" target="blank">http://training.csx.cam.ac.uk/bioinformatics/search</a>

## 깃허브 :octocat:

- 업데이트된 저장소: https://github.com/cellgeni/scRNA.seq.course
- 원본 과정 (오래됨) https://github.com/hemberg-lab/scRNA.seq.course


## 도커 이미지

[![Quay의 도커 저장소](https.img.shields.io/badge/container-quay.io-brightgreen)](https://quay.io/repository/cellgeni/scrna-seq-course?tab=tags)

이 과정은 모든 필수 패키지가 포함된 과정 도커 이미지를 실행하여 패키지 설치 없이 재현할 수 있습니다.

### 이미지 실행
시스템에 도커가 설치되어 있는지 확인하십시오. 그렇지 않은 경우 [이 지침](https://docs.docker.com/engine/installation/)을 따르십시오. 과정 도커 이미지를 실행하려면 [`최신` 버전](https://quay.io/repository/cellgeni/scrna-seq-course?tab=tags)을 사용하십시오.

`JUPYTER_TOKEN` 환경 변수를 컨테이너에 전달하여 특정 암호를 설정하거나 jupyter가 임의의 액세스 토큰을 생성하도록 할 수 있습니다.

```
docker run -p 8888:8888 -e JUPYTER_TOKEN=password quay.io/cellgeni/scrna-seq-course:latest
```

그런 다음 제공된 지침을 따르십시오. 예:
```
노트북에 액세스하려면 브라우저에서 이 파일을 여십시오:
    file:///home/jovyan/.local/share/jupyter/runtime/nbserver-6-open.html
또는 다음 URL 중 하나를 복사하여 붙여넣으십시오:
    http://(a9ee1aad5398 or 127.0.0.1):8888/?token=22debff49d9aae3c50e6b0b5241b47eefb1b8f883fcb7e6d
```

웹 브라우저(크롬 권장)에서 주피터 세션이 열립니다.

#### 윈도우 사용자

윈도우 운영 체제에서 컨테이너의 IP 주소는 `127.0.0.1` (`localhost`)과 다를 수 있습니다. IP 주소를 찾으려면 다음을 실행하십시오:
```
docker-machine ip default
```

### 데이터/기타 파일 다운로드

`New -> Terminal`을 클릭하십시오. 새 터미널 창에서 다음을 실행하십시오:
```
source <(curl -s https://raw.githubusercontent.com/cellgeni/scRNA.seq.course/master/setup.sh)
```

도커 이미지 외부에서 데이터 파일을 다운로드하려면 이 저장소의 `poststart.sh` 스크립트를 계속 사용할 수 있지만 컴퓨터에 [AWS CLI](https.docs.aws.amazon.com/cli/latest/userguide/install-bundle.html)를 설치해야 합니다.

또는 [이 링크](https://singlecellcourse.cog.sanger.ac.uk/index.html?shared=data/)를 방문하여 웹 브라우저에서 파일을 찾아보고 다운로드할 수 있습니다.

### RStudio

이제 주피터 브라우저 탭으로 돌아가 URL의 `tree`라는 단어를 `rstudio`로 변경하십시오. 모든 과정 파일, 소프트웨어 및 데이터 폴더를 사용할 수 있는 RStudio 서버가 열립니다.


### 컨테이너의 기본 소프트웨어
```bash
$ lsb_release -d
설명:    Ubuntu 20.04.2 LTS

$ R --version
R 버전 4.2.1 (2022-06-23) -- "Funny-Looking Kid"

$ rstudio-server version
2022.07.0+548 (Spotted Wakerobin) for Ubuntu Bionic
```

## 수동 설치

과정의 도커 버전을 사용하지 않는 경우, 과정의 모든 코드 청크를 실행하려면 [과정 깃허브 저장소](https://github.com/cellgeni/scRNA.seq.course)를 복제하거나 다운로드하고 `course_files` 폴더에서 R 세션을 시작해야 합니다. Unix/Mac에서 작업하는 경우 이 저장소의 `setup.sh`를 사용하여 과정 파일을 검색할 수도 있습니다. 또한 필요한 모든 R/파이썬 패키지를 수동으로 설치해야 합니다. 또는 관심 있는 장에 나열된 패키지만 설치할 수도 있습니다.

## 라이선스
모든 과정 자료는 <b>GPL-3</b>에 따라 라이선스가 부여됩니다. 누구나 scRNA-seq 데이터 분석에 대해 배우기 위해 자료를 살펴볼 수 있습니다. 자신의 교육에 자료를 사용할 계획이라면 적절한 인용을 제공하는 것 외에 저희에게 알려주시면 감사하겠습니다.

## 전제 조건

이 과정은 유닉스 및 R 스크립팅 언어에 대한 기본적인 지식이 있는 사람들을 대상으로 합니다.

또한 대량 RNA-seq 데이터 매핑 및 분석과 일반적으로 사용 가능한 계산 도구에 익숙하다고 가정합니다.

이 과정에 참석하기 전에 [RNA-seq 및 ChIP-seq 데이터 분석 소개](http://training.csx.cam.ac.uk/bioinformatics/search) 또는 [Bioconductor를 사용한 고처리량 시퀀싱 데이터 분석](http://training.csx.cam.ac.uk/bioinformatics/search)에 참석하는 것을 권장합니다.

## 인용

[튜토리얼: 단일 세포 RNA 시퀀싱 데이터의 계산 분석을 위한 지침](https.www.nature.com/articles/s41596-020-00409-w)을 인용하십시오.
> Andrews, T.S., Kiselev, V.Y., McCarthy, D. et al. Tutorial: guidelines for the computational analysis of single-cell RNA sequencing data. Nat Protoc 16, 1–9 (2021). https://doi.org/10.1038/s41596-020-00409-w

## 연락처

자료에 대한 __의견__, __질문__ 또는 __제안__이 있으시면 <a href="mailto:predeus@gmail.com">Alexander Predeus</a> 또는 <a href="mailto:hm533@cam.ac.uk">Hugo Tavares</a>에게 연락하십시오.