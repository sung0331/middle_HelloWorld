<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.BuyCartVo"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<BuyCartVo> prodSale = (List<BuyCartVo>) request.getAttribute("prodSale");
%>

<main>
	<!-- C3 css 추가 -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />

	<!--d3 c3 js추가 -->
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

	<div class="content">
		<section id="" class="">
			<div id="pageArea">

				<%
				// map
				HashMap<String, Integer> yearAndMonth = (HashMap<String, Integer>) request.getAttribute("yearAndMonth");
				%>
				<button class="page-button"  onclick="minusMonth()"><</button>
				<h2>
					<%=yearAndMonth.get("year")%>년&nbsp;<%=yearAndMonth.get("month")%>월&nbsp;
					월별 굿즈 상품 통계
				</h2>
				<button class="page-button"  onclick="plusMonth()">></button>
			</div>

			<div id="chart" width= "10px"></div>
			<script type="text/javascript">
				var chart = c3.generate({
					data : {
						columns : [ [

						'총판매량',

						<%for (int i = 0; i < prodSale.size(); i++) {%>
						'<%=prodSale.get(i).getAmount()%>'
						<%if (i != prodSale.size()) {%>,<%}
} //for end%>
						], //차트명, 차트별 value
						],
						type : 'bar', //차트타입
						colors : {
							'총판매량' : '#f73718' //차트의 color

						}
					},
					grid : {
						y : {
							show : true
						// 선여부
						},
					},
					bar : {
						width : {
							ratio : 0.3
						}
					},
					axis : {
						x : {
							type : 'category', //그룹 막대일 때 지정
							categories : [ 		<%for (int i = 0; i < prodSale.size(); i++) {%>
							'<%=prodSale.get(i).getProd_name()%>'
							<%if (i != prodSale.size()) {%>,<%}
} //for end%> ],
						},
						y : {
							//	max : 100, //최대값
							min : 0, //최소값
							padding : {
								top : 0,
								bottom : 0
							},
							tick : {
								count : 6
							}
						},

					},
					tooltip : { // 툴팁 여부
						show : true
					},
					legend : { //범례여부
						show : false
					},
					padding : {
						bottom : 100,
						top : 20
					}

				});
			</script>
		</section>
	</div>

	<div class="box"></div>

	<script>
function minusMonth() {
	let year = <%=yearAndMonth.get("year")%>;
    let month = <%=yearAndMonth.get("month")%>;
    console.log(year, month);
    if (month === 1) {
        year--;
        month = 12;
    } else {
        month--; 
    }

    console.log(year, month);
    location.href = "mangerSellProductInfo.do?year=" +year+"&month="+month;}
    
function plusMonth() {
	let year = <%=yearAndMonth.get("year")%>;
    let month = <%=yearAndMonth.get("month")%>;
    console.log(year, month);
    if (month === 12) {
        year++;
        month = 1;
    } else {
        month++; 
    }

    console.log(year, month);
    location.href = "mangerSellProductInfo.do?year=" +year+"&month="+month;}
</script>
</main>

