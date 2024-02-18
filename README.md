# '유기동물 입양 관리 웹 서비스' 프로젝트
### <주제> 
**유기동물 입양 웹 서비스 "야옹아 멍멍해봐"**<br>
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
매치된 데이터를 관리하기 위한 방법을 고안하는 과정이 있었습니다.
```Java
var photoRows = parsedPhotoData.TbAdpWaitAnimalPhotoView.row; //이미지 API key find
var infoRows = parsedInfoData.TbAdpWaitAnimalView.row; //정보 API key find
```
(1) 배열에 저장하기<br>
```JavaScript
// 'row' 배열의 각 객체 정보 확인하기
for(var i=0; i<infoRows.length; i++){
    var animalInfoNo = infoRows[i].ANIMAL_NO;
    let imageArr = [];
    for(var j=0; j<photoRows.length-1; j++){
        var animalPhotoNo = photoRows[j].ANIMAL_NO;
        if(animalInfoNo == animalPhotoNo){
            imageArr.push(photoRows[j].PHOTO_URL);
            if(animalInfoNo != photoRows[j+1].ANIMAL_NO){ //다음번호랑 같지 않을 경우
                var name = infoRows[i].NM;
                var date = infoRows[i].ENTRNC_DATE;
                var spcs = infoRows[i].SPCS;
                var intro = infoRows[i].INTRCN_CN;
                var intro_com = infoRows[i].TMPR_PRTC_CN;

                var arr = [animalPhotoNo,name,date,intro,intro_com,imageArr];
                infoList.push(arr);
            }
        }
    }
}
```
(2) 새로운 key 생성하기
```JavaScript
//이미지 API와 정보 API 동물번호를 기준으로 매칭하여 
//정보 API에 이미지 정보들을 저장하는 key 생성
for(var i=0; i<infoRows.length; i++){
    var animalInfoNo = infoRows[i].ANIMAL_NO;
    let imageArr = [];
    for(var j=0; j<photoRows.length; j++){
        var animalPhotoNo = photoRows[j].ANIMAL_NO;
        if(animalInfoNo == animalPhotoNo){
            imageArr.push(photoRows[j].PHOTO_URL);
        }
    }
    infoRows[i].PHOTO_LIST = imageArr;
}
```
첫 번째 시도는 매칭된 데이터를 배열에 저장하고 다시 배열에 저장하는 방법이었습니다.<br>
그러나 필요한 데이터만 따로 추출하여 배열에 저장해야했고, 이차 배열로 접근해야 했기 때문에 복잡한 접근 방식이 필요했습니다.<br>
다른 접근 방식을 고려하던 중, 새로운 key를 생성하여 기존의 API 데이터 구조를 변경하는 방법을 발견했습니다.<br>
이 방법을 적용하니 로직이 간단해졌습니다.<br>
기존의 API에서 제공하는 key - value 구조를 활용하여 데이터의 접근성이 좋아졌습니다.<br>
따라서, 새로운 key를 생성하는 두번째 방안을 선택하여 데이터를 관리하였습니다.<br>

<div align="center">
    <img src="https://github.com/LEEESOYEON/abandoned-animals/assets/150236010/f03fedae-84e0-412b-a12d-30539a7304d5" width="400" height="200">
</div>

***
 
 <br>
 
**2. 저장소 활용** <br>

- _*Session*_<br>
> 로그인된 사용자의 정보를 기억하기 위해 서버 저장소 활용<br>

비회원과 회원을 구분하여 서비스 접근에 대한 유효성을 구분하고 모든 객체에서 로그인 된 회원의 정보를 확인할 수 있어야 하기 때문에 Session 객체를 활용해보았습니다.<br>

- _*Cookie*_<br>
> 게시판에서 사용자의 요청을 서버로 전송하기 위해 클라이언트 저장소 활용<br>

동일한 jsp 파일에 사용자 요청( 게시판 '전체보기' 혹은 '내가 작성한 글 보기' )에 따른 데이터를 서버에서 받아와야 합니다.<br>
페이징이 적용된 게시판의 특성상 각 페이지 버튼에 지정된 URL마다 사용자의 요청이 무엇인지 기억해서 구성해주어야 하기 때문에 사용자 요청을 저장하는 곳이 필요했습니다.<br>
이때, Cookie 객체를 활용해보았습니다.<br>
사용자의 현재 요청사항을 Cookie에 저장해놓고 저장된 값을 이용하여 구성한 페이지 버튼의 URL을 서버로 전송하여 알맞은 데이터를 가져올 수 있었습니다.<br>

- _*LocalStorage*_<br>
> 유기동물 상세보기 기능에서 유기동물 정보를 저장하기 위해 브라우저 로컬 저장소 활용<br>

클라이언트가 유기동물 상세보기 페이지를 요청할 때, 해당 유기동물에 대한 데이터를 서버에 전달하고 다시 클라이언트로 전달하여 페이지를 구성해야 합니다.<br>
하지만 VO객체를 만들지 않고 데이터를 전송하는 방법을 고려하다 브라우저에서 제공하는 로컬 스토리지를 활용하기로 결정했습니다.<br>
이러한 접근 방식은 클라이언트가 서버로 많은 양의 데이터를 전달하지 않아도 되고, VO객체를 생성할 필요가 없어 유연성을 높일 수 있었습니다.<br>
클라이언트가 상세보기 페이지를 요청할 때 해당 데이터를 로컬 스토리지에 임시로 저장하고, 저장된 데이터를 활용하여 '입양 신청하기' 또는 '관심 등록하기'와 같이 데이터베이스에 데이터를 전송할 필요가 있을때에만 필요한 데이터를 서버로 전송할 수 있었습니다.<br>
<br>

**3. 비동기 통신** <br>

- _*게시판*_<br>
게시판 기능을 구현할 때 주로 서버와의 비동기 통신을 활용했습니다.<br>
특히, '제목 검색'기능을 구현할 때 클라이언트가 검색을 요청하면, 일치하는 내용의 데이터를 비동기적으로 가져와 화면을 동적으로 구성을 했습니다.<br>
이를 위해 JavaScript의 Fetch API를 학습하여 서버에 요청을 보내고, 데이터를 받아오는 방법을 적용해보았습니다.<br>
또한, '게시글 전체보기' 나 '내가 작성한 게시글 보기'와 같은 페이징 기능이 아닌, 다른 방법을 시도해보았습니다.<br>
결과적으로 일정 개수의 게시물을 보여주고 '더보기'버튼을 클릭할 때마다 추가적인 게시물을 불러오는 방식을 고안해내어 적용했습니다.<br>
이를 통해 화면이 한 번에 많은 양의 데이터로 인해 넘치는 것을 방지하면서 또 다른 경험을 향상시킬 수 있었습니다.<br>

<div align="center">
     <img src="https://github.com/LEEESOYEON/abandoned-animals/assets/150236010/85545378-babb-422e-8752-2edef568f2f3" width="250" height="150"/>
</div>

- _*입양 현황 정보*_<br>
'유기동물 상세보기' 페이지에서 입양 중복 신청을 방지하기 위해 서버와의 비동기 통신을 활용했습니다.<br>
클라이언트가 해당 동물에 대한 상세 정보를 요청하면, 서버에 AJAX 요청을 보내 해당 동물에 대한 입양 신청 진행 여부를 확인합니다.<br>
이를 통해 데이터베이스로부터 데이터를 받아와 클라이언트에서 동적으로 화면을 구성합니다.<br>
받아온 데이터가 있을 경우 이미 입양 신청이 진행 중이기 때문에 입양 신청에 대한 현황을 동적으로 표시하고, 입양 신청이 불가하도록 하여 중복을 방지할 수 있습니다.<br>

<div align="center">
     <img src="https://github.com/LEEESOYEON/abandoned-animals/assets/150236010/18391941-ae4b-4293-9d2d-b1cdaa671a48" width="250" height="150"/>
</div>

