<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/cart.css">

	<script>
    //      Number(counterA.innerHTML)
    window.onload = function(){
        var add_btn = document.getElementById('add_btn');
        var min_btn = document.getElementById('min_btn');
        var count = document.getElementById('count');
        add_btn.onclick = function(){
            count.innerHTML=Number(count.innerHTML) + 1;
        };
        min_btn.onclick = function(){
            count.innerHTML = Number(count.innerHTML) - 1;
        };
    };
	</script>

    <!--        cart_section         -->
    <div class="cart">
        <h5 class="cart_title">장바구니</h5>
        <table class="cart_table">
            <colgroup>
                <col style="width:5%;">
                <col style="width:5%;">
                <col style="width:40%;">
                <col style="width:20%;">
                <col style="width:15%;">
                <col style="width:15%;">
            </colgroup>
            <thead>
                <th scope="col">번호</th>
                <th scope="col" >1</th>
                <th scope="col" >상품정보</th>
                <th scope="col">수량</th>
                <th scope="col">가격</th>
                <th scope="col">배송비</th>
            </thead>
            <tbody>
                <tr>
                    <td>${ dto.order_list_idx }</td>
                    <td class="img_sec">
                        <div class="prd_img">
                            <img src="/img/items/ring/ring02_1.jpg">
                            ${ dto.order_item_img }
                        </div>
                    </td>
                    <td>
                        <div class="prd_name">
                            ${ dto.order_item_info }
                        </div>
                        <button class="delete_btn">삭제하기</button>
                    </td>
                    <td>
                        <div class="btn_qty">
                            <button id="min_btn">-</button>
                            <span id="count">1</span>
                            <button id="add_btn">+</button>
                            <button id="change_btn">변경</button>
                        </div>
                    </td>
                    <td>${ dto.item_price }</td>
                    <td>${ dto.delivery_price }</td>
                </tr>
            </tbody>
        </table>
        <div class="order_price">
            <div class="total_price">
                <span>상품 합계</span><span>&nbsp&nbsp&nbsp</span>
                <span>${ dto.item_price }</span>
            </div>
            <div class="deli_price">
                <span>배송비</span><span>&nbsp&nbsp&nbsp</span>
                <span>${ dto.delivery_price }</span>
            </div>
        </div>
        <div class="btn_sec">
            <button class="order_btn">주문하기</button>
        </div>
    </div>

<c:import url="../user_footer.jsp" />