<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="java.util.List"%>
<%@ page import="com.study.springboot.dto.ItemsDto" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="../user_header.jsp" />


<link rel="stylesheet" href="/css/user/items_content.css">


<script type="text/javascript">

    // Review dorp
    (function($, undefined){
        
        $.fn.multiOpenMenu = function(options) {

        // 메뉴가 될 엘리먼트가 없는    `~AQZ/']지 체크합니다.
            if(this.length === 0) {
                return this;
            }

            // 기본값 설정
            var settings = $.extend({

            }, options);

            // 초기 메뉴를 생성합니다.
            var headers = this.find(">a");
            $.each(headers, function(i, opt) {
                if(i != settings.active) {
                    $(this).next().hide();
                }
            });

            // 메뉴를 클릭했을때 서브 메뉴를 보여주는 이벤트를 만듭니다.
            headers.on('click', function() {
                var menuArea = $(this).next();
                var isOpen = menuArea.is(":visible");

                // 열린 상태에 따라 이벤트를 반전해서 발생시킨다.
                menuArea[isOpen ? 'slideUp' : 'slideDown']().trigger(isOpen ? 'hide' : 'show');
                
                // 이벤트 버블링을 멈춘다.
                return false;
            });

            return this;

        };

    }(jQuery));

    // 메뉴를 생성합니다.

    $(function(){
        $("#menu").multiOpenMenu();
    });

    //파일업로드
    $(function () {
            $('.upload_text').val('파일을 선택하세요.');
            $('.input_file').change(function () {
                var i = $(this).val();
                $('.upload_text').val(i);
            });
        });

	

	var item_price;
	var item_amount;

	function init () {
		item_price = document.form.item_price.value;
		item_amount = document.form.item_amount.value;
		document.form.total.value = item_price;
		change();
	}

	function add () {
		hm = document.form.item_amount;
		total = document.form.total;
		hm.value ++ ;

		total.value = parseInt(hm.value) * item_price + 2500;

		if(total.value >= 30000){
			document.form.transfee.value = 0;
			total.value = parseInt(hm.value) * item_price + 0;
			} else if(total.value < 30000){
				document.form.transfee.value = 2500;
				total.value = parseInt(hm.value) * item_price + 2500;
				}
	}

	function del () {
		hm = document.form.item_amount;
		total = document.form.total;
		
			if (hm.value > 1) {
				hm.value -- ;
				total.value = parseInt(hm.value) * item_price + 2500;
			}

			if(total.value < 30000){
				document.form.transfee.value = 2500;
				total.value = total.value = parseInt(hm.value) * item_price + 2500;
				}

			
	}

	function change () {
		hm = document.form.item_amount;
		total = document.form.total;
		tf = document.form.transfee;

			if (hm.value < 0) {
				hm.value = 0;
			}
			
		total.value = (parseInt(hm.value) * item_price) + 2500;

	
			
	}  


	

	
	$(document).ready(function() { 

		var link = document.location.href; console.log(link);

		document.form.page_url.value = link;
    	
	});
    
</script>


    <div class="order_section">
    
   
    

     
    	<form action="order_view2" name="form" method="get" >
   
    	
    	<input type="hidden" name="item_idx" value="${dto.item_idx}" />
    	<input type="hidden" name="member_id" value="${memberDto.member_id}" />
    	<input type="hidden" name="page_url" value="" />
    	
        <div class="order">
            <div style="margin-right: 60px;">
                <img src="${ dto.item_MainImg }" alt="상품이미지" style="width: 300px;">
                <input type="hidden" value="${ dto.item_MainImg }"  name="item_img"/>
            </div>
            <div style="margin-left: 60px;">
                <div>
                    <div>
                        <ul style="border-bottom: solid 1px #484848;">
                            <li style="font-weight: bold; font-size: 18px;" ><input type="text" style="border: none; outline:none; width: 100%;" value="${ dto.item_name }" name="item_name" readonly /></li>
                        </ul>
                    </div>
                    <div class="order_list">
                        <ul style="font-size: 13px; font-weight: bold;">
                            <li>판매 가격</li>
                            <li>&nbsp;</li>
                            <li>수량</li>
                            <li>배송비</li>
                            <li>총 결제금액</li>
                        </ul>
                        <ul style="margin-left: 90px; font-size: 13px;">
                            <li id="price" >${ dto.item_price }</li>
                            <li>${ dto.item_category } <input type=hidden name="item_category" value="${ dto.item_category }">  </li>                                                 
                            <li> <input type=hidden name="item_price" value="${ dto.item_price }">
                                    <input type="button" value=" - " onclick="del();">
                                    <input type="text" name="item_amount" value="1" size="3" onchange="change();">
                                    <input type="button" value=" + " onclick="add();">&nbsp;&nbsp; *10개 미만 구매 가능</li>
                            <li><input type="text" style="border: none; outline:none; width: 100%;" value="2500" name="transfee" id="transfee" readonly /></li>
                            <!--  배송비 + 상품가격(*개수) 가 출력되도록  -->
                            <li><input type="text" name="total" size="11" readonly>원</li>
                         </ul>
                    </div>
                </div>
                <div class="btn_wrap">
                
                	<c:if test="${ memberDto.member_id ne null }">    
             	        
	        		   <button type="submit" value="cart" formaction="cart_add" onclick="cart();" style="margin-right: 5px;">장바구니</button>
	        		   <button type="submit" value="buy"  onclick="return payment();" style="margin-left: 5px;">구매하기</button>
	        		   
            	    </c:if>
            
            		<c:if test="${ memberDto.member_id eq null }">            
	            	    <button type="button" value="cart" onclick="chk();" style="margin-right: 5px;">장바구니</button>
            			<button type="button" value="buy"  onclick="chk();"	style="margin-left: 5px;">구매하기</button>  
            		</c:if>
          	          
                               
                </div>
            </div>
        </div>
      		
        <div class="section">
            <div class="detail_section">
                <div id="detailPage">
                    <div style="height: 40px;"></div>
                    <div class="section_nav">
                        <div style="border: solid 2px #585858; border-bottom: none;"><a href="#detailPage" style="font-weight: normal;  color: #585858;">상세페이지</a></div>
                        <div><a href="#review">Review</a></div>
                        <div><a href="#qna">QNA</a></div>
                        <div style="border-right: solid 1px #aaaaaa;"><a href="#return" style="font-weight: normal;">반품/교환정보</a></div>
                    </div>
                    <div style="height: 35px;"></div>
                    <div class="detailPage_Post">
                        <div>
                            <img src="${ dto.item_MainImg }" alt="상품이미지" style="width: 300px;">
                        </div>
                        <div>
                        
                            <pre style="font-weight: normal;">
                            <input type="hidden" name="item_content" value="${ dto.item_content }" />                           
							${ dto.item_content }
                            </pre>
                            
                        </div>
                    </div>
                </div>
                </form>
                
                <div id="review" style="margin-top: 100px;">
                    <div style="height: 40px;"></div>
                    <div class="section_nav">
                        <div><a href="#detailPage" style="font-weight: normal;">상세페이지</a></div>
                        <div style="border: solid 2px #585858; border-bottom: none;"><a href="#review" style=" color: #585858;">Review</a></div>
                        <div><a href="#qna">QNA</a></div>
                        <div style="border-right: solid 1px #aaaaaa;"><a href="#return" style="font-weight: normal;">반품/교환정보</a></div>
                    </div>
                    <ul style="margin-top: 50px;">
                        <li>REVIEW</li>
                    </ul>
                    <div>
                        <div class="review_post">
                            <div>
                                <textarea placeholder="리뷰를 남겨주세요."></textarea>
                            </div>
                            <div style="display: flex; justify-content: space-between; width: 1000px; margin-left: 40px;" >
                                <div class="file">
                                    <div class="upload-btn_wrap">
                                        <button type="button" title="파일등록">
                                            <div>
                                                <span style="margin-right: 3px;">
                                                    <img src="dslr-camera.png" alt="" style="width: 20px;">
                                                </span>
                                            </div>
                                            <div>
                                                <span style="padding-left: 3px;">파일등록</span>
                                            </div>
                                        </button>
                                        <input type="file" class="input_file" title="파일등록">
                                    </div>
                                        <!--input box-->
                                    <input type="text" class="upload_text" readonly="readonly" style="font-weight: normal; margin-left: 5px; margin-top: 5px;">
                                </div>
                                
                                <select name="" id="" style="width: 450px;">
                                    <option value="5">★ ★ ★ ★ ★</option>
                                    <option value="4">★ ★ ★ ★</option>
                                    <option value="3">★ ★ ★</option>
                                    <option value="2">★ ★</option>
                                    <option value="1">★</option>
                                </select>
                                <button id="review_button">리뷰 등록하기</button>
                            </div>
                        </div>
                        <div id="menu">
                            <a class="review">
                                <span style="flex-grow: 1;">
                                    <p>2</p>
                                </span>
                                <span style="flex-grow: 1;">
                                    <img src="http://placehold.it/70x50">
                                </span>
                                <span style="flex-grow: 8;">
                                    <p>
                                        2017-01-01   12:48:26 |  webplan
                                    </p>
                                    <p>
                                        친절한 상담 빠른 배송 감사합니다.
                                    </p>
                                </span>
                                <span style="flex-grow: 2;">
                                    <p>★ ★ ★ ★</p>
                                </span>
                                <span style="flex-grow: 1;">
                                    보기▼
                                </span>
                            </a>
                            <div class="view">
                                <span style="flex-grow: 1;">
                                    <img src="http://placehold.it/130x80">
                                </span>
                                <span style="flex-grow: 8;">
                                    <p>
                                        친절한 상담 빠른 배송 감사합니다. 앞으로도 많은 이용하겠습니다.
                                    </p>
                                </span>
                                <span  style="flex-grow: 1;">
                                    <button>수정</button>
                                    <button>삭제</button>
                                </span>
                            </div>
                    
                            <a class="review">
                                <span style="flex-grow: 1;">
                                    <p>1</p>
                                </span>
                                <span style="flex-grow: 1;">
                                    <img src="http://placehold.it/70x50">
                                </span>
                                <span style="flex-grow: 8;">
                                    <p>
                                        2017-01-01   12:48:26 |  webplan
                                    </p>
                                    <p>
                                        친절한 상담 빠른 배송 감사합니다.
                                    </p>
                                </span>
                                <span style="flex-grow: 2;">
                                    <p>★ ★ ★</p>
                                </span>
                                <span style="flex-grow: 1;">
                                    보기▼
                                </span>
                            </a>
                            <div class="view">
                                <span style="flex-grow: 1;">
                                    <img src="http://placehold.it/130x80">
                                </span>
                                <span style="flex-grow: 8;">
                                    <p>
                                        친절한 상담 빠른 배송 감사합니다. 앞으로도 많은 이용하겠습니다.
                                    </p>
                                </span>
                                <span  style="flex-grow: 1;">
                                    <button>수정</button>
                                    <button>삭제</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="qna" style="margin-top: 100px;">
                    <div style="height: 35px;"></div>
                    <div class="section_nav">
                        <div><a href="#detailPage" style="font-weight: normal;">상세페이지</a></div>
                        <div><a href="#review">Review</a></div>
                        <div style="border: solid 2px #585858; border-bottom: none;"><a href="#qna" style=" color: #585858;">QNA</a></div>
                        <div style="border-right: solid 1px #aaaaaa;"><a href="#return" style="font-weight: normal;">반품/교환정보</a></div>
                    </div>
                    <ul style="margin-top: 50px;">
                        <li>QNA</li>
                    </ul>
                    <div>
                        <table>
                            <tr style="border-bottom: solid 2px #525252; color: #585858;">
                                <td>번호</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회</td>
                            </tr>
                            <tr style="color: #525252;">
                                <td>3</td>
                                <td style="font-weight: normal;">배송 전 변경 및 취소</td>
                                <td style="font-weight: normal;">ㅇㅇㅇ</td>
                                <td>2020-09-17</td>
                                <td>2</td>
                            </tr>
                            <tr style="color: #525252;">
                                <td>2</td>
                                <td style="font-weight: normal;">배송 전 변경 및 취소</td>
                                <td style="font-weight: normal;">ㅇㅇㅇ</td>
                                <td>2020-09-17</td>
                                <td>2</td>
                            </tr>
                            <tr style="color: #525252;">
                                <td>1</td>
                                <td style="font-weight: normal;">배송 전 변경 및 취소</td>
                                <td style="font-weight: normal;">ㅇㅇㅇ</td>
                                <td>2020-09-17</td>
                                <td>2</td>
                            </tr>
                            <tr style="color: #525252;">
                                <td></td>
                                <td style="font-weight: normal;">re::배송 전 변경 및 취소</td>
                                <td style="font-weight: normal;">비쥬</td>
                                <td>2020-09-17</td>
                                <td>2</td>
                            </tr>
                        </table>
                        <button id="qna_button">문의하기</button>
                    </div>
                </div>
                <div id="return" style="margin-top: 100px;">
                    <div style="height: 35px;"></div>
                    <div class="section_nav">
                        <div><a href="#detailPage" style="font-weight: normal;">상세페이지</a></div>
                        <div><a href="#review">Review</a></div>
                        <div><a href="#qna">QNA</a></div>
                        <div style="border-right: solid 1px #aaaaaa; border: solid 2px #585858;
                                    border-bottom: none;"><a href="#return" style="font-weight: normal; 
                                    color: #585858;">
                            반품/교환정보</a></div>
                    </div>
                    <ul>
                        <li style="font-weight: normal; margin-top: 50px;"> 반품/교환정보</li>
                    </ul>
                    <div>
                        <img src="/img/image_1623232914497_1000 (1).jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        
    
    </div>   <!-- end of order_section -->
    
    <script>
    function chk(){
		alert("로그인 해주세요");

		return false;
		}

//구매하기 함수
	
	function payment(){
			
		
		if(confirm("해당페이지의 상품만 결제합니다.\n다른상품과 함께 결제하고 싶으시면 장바구니로 이동해주세요.") == true){

			location.href="/order_view2";
			
		}else{
			
		  return false;
		  
			}
		
		}


	function cart(){
		alert('상품이 장바구니에 담겼습니다.');
		
	}

    </script>

      	<c:import url="../user_footer.jsp" />