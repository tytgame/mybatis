<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberEnrollForm</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
           let roadAddress = data.roadAddress; // 도로명 주소
		   let jibunAddress = data.jibunAddress; // 지번 주소
		   let extraAddress = '';				// 동이나 빌딩명을 넣을 변수

		   if(data.userSelectedType == 'R') {	// 사용자가 도로명주소를 선택함
				if(data.bname != '') {
					extraAddress += data.bname;		// 동이름 넣기
				}
				if(data.buildingName != '') {
					extraAddress += ', ' + data.buildingName;	// 빌딩명 넣기
				}
				roadAddress += extraAddress != '' ? '(' + extraAddress + ')' : '';
				document.getElementById("addr").value = roadAddress;
		   } else {		// 사용자가 지번을 선택함
				if(data.buildingName != '') {
					extraAddress += ', ' + data.buildingName;	// 빌딩명 넣기
				}
				jibunAddress += extraAddress != '' ? '(' + extraAddress + ')' : '';
				document.getElementById("addr").value = jibunAddress;
		   }
		   document.getElementById('detailAddress').focus();
        }
    }).open();
}
</script> -->
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <h1>회원가입</h1>
        <form method="post" action="insert.me" id="enrollForm">
            <table align="center">
                <tr>
                    <td>* ID </td>
                    <td><input name="userId" id="userid" required></td>
                    <div id="checkResult"></div>
                </tr>
                <tr>
                    <td>* PASSWORD</td>
                    <td><input type="password" name="userPwd"></td>
                </tr>
                <tr>
                    <td>* NAME</td>
                    <td><input name="name"></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>Birthday</td>
                    <td><input name="birthday"></td>
                </tr>
                <tr>
                    <td>GENDER</td>
                    <td><input type="radio" name="gender" value="M">남자</td>&ensp;
                    <td><input type="radio" name="gender" value="F">여자</td>
                </tr>
                <tr>
                	<td>PHONE</td>
                	<td><input name="phone"></td>
                </tr>
                <tr>
                    <td>ADDRESS</td>
                    <td>
                        <input name="address" id="addr">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="회원가입">&emsp;
                        <input type="reset" value="초기화">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <script>
      $(() => {
         let $input = $('#userid');
         $input.keyup(function() {
            if($input.val().length >= 5) {
               $.ajax({
                  url: "idCheck.me",
                  data:{checkId: $input.val()},
                  success: function(result) {
                     if(result == 'idN') {
                        $('#checkResult').show();
                        $('#checkResult').css('color','red').text('사용할 수 없습니다');
                        $('#enrollForm :submit').attr('disabled', true);
                     } else {
                        $('#checkResult').show();
                        $('#checkResult').css('color','green').text('멋진 아이디네요');
                        $('#enrollForm :submit').attr('disabled', false);
                     }
                  },
                  error: function() {
                     console.log("아이디 중복 ajax 통신 실패");
                  }
               })
            } else {
               $('#checkResult').hide();
               $('#enrollForm :submit').attr('disabled', true);
            }
         })
      })
   </script>
</body>
</html>








