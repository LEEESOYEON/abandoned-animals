# '유기동물 입양 관리 웹 서비스' 프로젝트
### <주제> 
**유기동물 입양 웹 서비스**<br>
### <프로젝트 목적> 
**MVC2패턴을 활용한 웹 개발 경험**<br>
### <개발 일정> 
**2023.12.29 ~ 2024.01.19 (21일)**<br>
### <개발 인원> 
**2명 (팀장)**<br>

- ### __*소개*__<br>
반려동물 가정 수의 비율이 증가하는 만큼 유실유기동물의 비율 역시 증가하고 있습니다.<br>
따라서, 유기동물 입양에 대한 인식이 앞서는 만큼 반려동물에 대한 입양을 고려하는 사람들에게 유기동물 공공데이터를 이용하여 다양한 정보를 제공하고자 합니다.<br>
사용자들에게 보다 친근한 접근이 가능하게 하기 위해 부가적인 서비스를 제공하는 웹을 개발하게 되었습니다.<br>

- ### __*활용기술*__<br>

**1. 공공데이터 API** <br>
<br>
 공공데이터포털에서 제공하는 유기동물 사진 데이터와 유기동물 정보 데이터가 있는 API를 호출하였습니다.<br>
 데이터는 key - value 형식의 JSON으로 제공되었습니다.<br>
String 타입으로 전송받은 데이터를 key값을 이용하여 접근하기 용이하게 하기위해 클라이언트 단에서 JSON 형식으로 파싱하는 작업을 했습니다.<br>
원하는 데이터가 있는 key에 접근하기 위해 JSON 파일을 분석하였고,<br>
두 개의 API에서 가져온 데이터를 공통되는 값인 '유기동물 번호'를 기준으로 매치시키기 위해 for문을 활용하였습니다.<br>

***
##### 매치된 데이터 관리하기
```Java
var photoRows = parsedPhotoData.TbAdpWaitAnimalPhotoView.row; //이미지 API key find
var infoRows = parsedInfoData.TbAdpWaitAnimalView.row; //정보 API key find
```
(1) 배열에 저장하기<br>
```Java
var arrList = [];
for(var i=0; i<rows2.length; i++){
    var animalNo2 = rows2[i].ANIMAL_NO;
    let imageArr = [];
    for(var j=0; j<rows.length-1; j++){
        var animalNo = rows[j].ANIMAL_NO;
        if(animalNo2 == animalNo){
            imageArr.push(rows[j].PHOTO_URL);
            if(animalNo2 != rows[j+1].ANIMAL_NO){ //다음번호랑 같지 않을 경우
                var name = rows2[i].NM;
                var date = rows2[i].ENTRNC_DATE;
                var spcs = rows2[i].SPCS;
                var intro = rows2[i].INTRCN_CN;
                var intro_com = rows2[i].TMPR_PRTC_CN;
    
                var arr = [animalNo,name,date,intro,intro_com,imageArr];
                arrList.push(arr);
            }
        }
    }
}
```
(2) 새로운 key 생성하기
```Java
//이미지 API와 정보 API 동물번호를 기준으로 매칭하여 
//정보 API에 이미지 정보들을 저장하는 key 생성
for(var i=0; i<infoRows.length; i++){
    var animalInfoNo = infoRows[i].ANIMAL_NO;
    let imageArr = [];
    for(var j=0; j<photoRows.length; j++){
        var animalPhotoNo = photoRows[j].ANIMAL_NO;
        if(animalInfoNo == animalPhotoNo){
            imageArr.push(photoRows[j].PHOTO_URL);
            //break;
        }
    }
    infoRows[i].PHOTO_LIST = imageArr;
}
```

| 매치된 데이터 관리 | 장점 | 단점 |
|---------|-----|-----|
| 배열에 저장하기 | 필요한 데이터가 저장된 배열에만 접근하여 소요 시간이 비교적 적어 데이터 관리 수월 | 데이터 전송이 복잡 |
| 새로운 key 생성하기 | JSON형태로 데이터 전송이 간편하여 데이터 접근 용이 | 필요한 데이터에 접근 시 배열안에 배열에 접근하여 소요 시간 ↑ |

***

두 가지 로직을 비교하여 유기동물 정보 데이터가 있는 API에 새로운 key를 생성하여 사진 데이터를 배열로 저장했습니다.<br>
 
 <br>
 
**2. 저장소 활용** <br>

- _*Session*_<br>
> 로그인된 사용자의 정보를 기억하기 위해 서버 저장소 활용<br>

비회원과 회원을 구분하여 서비스 접근에 대한 유효성을 구분하고 모든 객체에서 로그인 된 회원의 정보를 확인할 수 있어야 하기 때문에 Session 객체를 활용해보았다.<br>

- _*Cookie*_<br>
> 게시판에서 사용자의 요청을 서버로 전송하기 위해 클라이언트 저장소 활용<br>


동일한 jsp 파일에 사용자 요청( 게시판 '전체보기' 혹은 '내가 작성한 글 보기' )에 따른 데이터를 서버에서 받아와야 한다.<br>
페이징이 적용된 게시판의 특성상 각 페이지 버튼에 지정된 URL마다 사용자의 요청이 무엇인지 기억해서 구성해주어야 하기 때문에 사용자 요청을 저장하는 곳이 필요했다.<br>
보안상 적절한 방법으로 서버로 데이터 전송이 가능한 Cookie 객체를 활용해보았다.<br>

- _*LocalStorage*_<br>
> 유기동물 상세보기 기능에서 유기동물 정보를 저장하기 위해 브라우저 로컬 저장소 활용<br>

사용자가 선택한 유기동물에 대한 데이터를 바탕으로 상세보기 페이지 구성 시 해당 데이터를 클라이언트단으로 전달해 화면을 구성해주면 되지만 '입양 신청하기' 혹은 '관심 등록하기' 기능 구현 시 서버로 데이터를 전송하기에 JSON 파일을 재파싱하는 번거로움을 줄이고자 파싱된 데이터를 로컬 스토리지에 임시 저장한 상태로 활용<br>
사용자가 선택한 유기동물에 대한 데이터를 상세보기 페이지에 가져오기 위해 로컬 스토리지에 임시 저장<br>
저장된 데이터를 활용하여 '입양 신청하기' 혹은 '관심 등록하기' 기능 구현 시 서버로 데이터를 전송<br>

<br>

**3. 동기 및 비동기 통신** <br>



