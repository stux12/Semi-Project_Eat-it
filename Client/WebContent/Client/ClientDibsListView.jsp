<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="../CSS/main_style.css?after">
<style>

.header{
	width: 100%;
	height: 60px;
	text-align: center;
}

.logo {
   margin-top: 2px;
   background-image:
      url(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQvMBl%2FbtqWU73BhKO%2F5wu0ncSqNIH9pLpQ6A4Pm1%2Fimg.png);
   background-size: cover;
}

.logo a {
   display: block;
   width: 100px;
   height: 60px;
   cursor: pointer;
}

.menubar {
   position: fixed;
   z-index:3;
   display: flex;
   width: 100%;
   height: 60px;
   border-bottom:1px solid gray;
}
.menubar_menulist {
   right: 0px;
   display: inline;
}
.align-right {
   margin-left: auto;
   position:relative
}
.search {
   margin: auto;
   width: 500px;
   margin-left :20px;
}

.dropdown {
   display: inline-block;
}

.dropbtn {
   color:black;
   background-color: transparent;
   padding: 16px;
   font-size: 1vw;
   border: none;
   cursor: pointer;
   outline: 0;
   
}

.dropdown-content {
   background-color: transparent;
   display: none;
   position: absolute;
   min-width: 160px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   z-index: 1;
   border:1px;
}

.dropdown-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
   background:#ffffff4a;
}

.dropdown-content a:hover {
   background-color: #ddd;
}


.dropdown:hover .dropbtn {
   background-color: transparent;
}
.search_input {
   padding: 5px;
   width: 280px;
   height: 35px;
   border:0;
   border-radius: 8px;
   font-size: 14pt;
}
.search_input:focus{
   outline:none;
}
.search_btn {
   padding: 5px;
   border: solid 5px #3450b4;
   font-weight: bold;
   font-size: 14pt;
   border-radius:20px;
   color: white;
   background-color: #3450b4;
}

section{
	text-align: center;
	width: 50%;
	margin: 0 auto;
	box-sizing: border-box;
	height: 100%;
	align-items:center;
/* 	border: 1px solid orange;
	border-radius: 10px;	 */	
}
.title{
	background-color:#FFA500;
	font-size:50px;
	width: 100%;
	height: 20%;
	margin-bottom:50px;	
	border-radius: 10px;		
}
table{
	width:90%;
	height:100px;
	margin:auto;
	text-align:center;
	padding: 3px;
}
.btn_image{
	background: url( "img/star_32.png" ) no-repeat;
    border: none;
    width: 32px;
    height: 32px;
    cursor: pointer;
}
td {
  border-bottom: 1px solid #FFA500;
}
.JJim_img{
	width:150px;
	height:100px;
}
a.top {
	 position: fixed;
     right: 10px;
     bottom: 10px;
     display: none;
}

/*    TOP 버튼 확인용   
div {
	margin: auto;
	width: 500px;
	height: 1000px;
	border: 1px solid #bcbcbc;
      } */

</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.top' ).fadeIn();
          } else {
            $( '.top' ).fadeOut();
          }
        } );
        $( '.top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
      
      
      
      function fade(){
    	     $('.dropdown-content').show(520);
    	  };
      function fadeo(){
    	     $('.dropdown-content').hide(520);
    	  };
    	  window.addEventListener("resize", homzzang);
    	  function homzzang(){
    	     var windowWidth =  $(window).width();
    	  if(windowWidth<750){
    	     $('.dropbtn').css("visibility","hidden");
    	     $('.dropdown-content a').css("display","none");
    	     $('.dropdown-content hr').css("display","none");
    	  }else{
    	     $('.dropbtn').css("visibility","visible");
    	     $('.dropdown-content a').css("display","block");
    	     $('.dropdown-content hr').css("display","block");
    	  }

    	  };
    	  
    
</script>

</head>
<body>
		<!-- 상단부분 -->
	
	<header class="header">
		 <div class="menubar">
         <div class="logo">
            <a href="/EAT-iT/main.jsp"></a>
         </div>

         <div class="search">
            <form action="serve.do">
           
               <input class="search_input" type="text" name="search" placeholder="검색어를 입력하세요">
                                                  <!-- request.getParameter("search") -->
               <input class="search_btn" type="submit" value="검색">
            </form>
         </div>

         <div class="align-right">
            <div class="dropdown" onmouseenter="fade()" onmouseleave="fadeo()">
               <button class="dropbtn">테마별 맛집 추천</button>
               <div class="dropdown-content" >
                  <a href="serve.do?address=강남">지역별 </a>
                  <hr>
                   <a href="review.do">리뷰별 </a>
                   <hr>
                   <a href="serve.do?kinds=일식">종류별 </a>
               </div>
            </div>
            <div class="menubar_menulist">
             
                 <c:if test="${(id1!=null&&id1!='admin') ? true : false}">
                <a href="ClientDibsListView.do"><button class="dropbtn">찜 리스트</button></a>
                  <a href="ClientOneView.do"><button class="dropbtn">내정보</button></a>
                   <a href="LogOut.do"><button class="dropbtn">로그아웃</button></a>
                 </c:if>
                 <c:if test="${(id1=='admin') ? true : false }">
                 <a href="ClientAllView.do"><button class="dropbtn">회원관리</button></a>
                 </c:if>
                  <c:if test="${(id1==null) ? true : false}">
                   <a href="/EAT-iT/Client/Client_Login.jsp" ><button class="dropbtn">로그인</button></a>
             
                </c:if>
            </div>
         </div>
      </div>
	</header>
	<br />
	<br />
	<br />
		<!--  중간 -->
	<section>
	<div class="title">like List </div>
	<table >
		<c:forEach var="i" items="${alist1}">
			<tr>
				<td>
					<a href="####상세화면으로 ㄱㄱ ######/${i.mutual}" target="_blank">
						<img src="${i.img}" class="JJim_img" alt="" /></a>
				</td>
				<td>${i.mutual} </td>
				<td>
					<form action="ClientDibsListDelete.do">
				<!-- 	<input type="submit" value="찜목록해제" onclick="Button1_Click('mutual')"/> -->
						<button type="submit" class="btn_image" id="img_btn" onclick="Button1_Click('mutual')"></button>
						<input type="hidden" value='${i.mutual}' name="mutual1" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	</section>
	<br />
	<br />
	<br />
	<!-- 하단부분 -->
	<%@ include file="/mainframe/footer.jsp"%>
	<div>
		<a href="#section" class=top>
		<img alt="맨위로" src="img/upbtn_64.png"> </a>
	</div>

</body>
</html>