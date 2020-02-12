<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>��Ź�� ������������</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/>
	<link rel="stylesheet" type="text/css" href="../css/admin_coupon.css"/><!-- ���� ������ ������ css�� �ٲ���� -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			//���, Ǫ�Ϳ���
			$("#admin").load("./admin.jsp")
			
		
		//�˻�
		function searchOrder() {
			
			var checkbox = $("input[name=check]:checked");
			
			$.ajax({
				url:'/setak/admin/memberSearch.do', 
				type:'POST',
				data:param,
				traditional : true,
				dataType:"json", //���� ������ Ÿ��
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {	
					$("#result-table tbody").empty();
					
					if($("#allcheck").prop("checked")){
						 $("#allcheck").prop("checked",false);
					}
					
					 var count = data.orderSearchCount;
					 $("#result-num").text(count); 
					 
					 var list = data.orderSearchList;
					 
					 $.each(list, function(index, item) {
						 
						 var delicode = item.order_delicode;
						 console.log(delicode); 
						 if(delicode == null) {
							 delicode = "-"; 
						 }
						 
						 var output = '';
						 
						 output += '<tr>';
							 output += '<td class = "check"> <input type = "checkbox"  name = "chk"/> </td>';
						 output += '<td><input class="orderNum" type="button" onclick="layerOrderDetail('+'\'open\',\''+item.order_num+'\''+')" value="'+item.order_num+'"/></td>';
						 output += '<td>'+item.member_id+'</td>';						 
						 output += '<td>'+item.order_name+'</td>';						 
						 output += '<td>20'+date+'</td>';
						 output += '<td>'+item.order_price+'��</td>';
						 output += '<td><span id = "delivery_num">'+delicode+'</span></td>';	
						 output += '<td>'+item.order_status+'</td>';
						 output += '</tr>';
						 
						 $('#result-table tbody').append(output); 
					 });

				},
				error: function() {
					alert("ajax��� ����!!!");
			    }
			});
		}	
			
			//��� ����
			function selectData(){
				
				$.ajax({
					url : '/setak/Admin_CouponList.do',
					type : 'POST',
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';
							
							str += '<ul>'
							str += '<li class="listtd"><input type="checkbox"></li>';
							str += '<li class="listtd">' + item.member_id + '</li>';
							str += '<li class="listtd">' + item.coupon_name + '</li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_start" value="' + item.coupon_start + '" disabled></li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_end" value="' + item.coupon_end + '" disabled></li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_useday" value="' + item.coupon_useday + '" disabled></li>';
							str += '<li class="listtd"><select class="coupon_use" name="coupon_use" disabled>';
							str += '<option value=' + item.coupon_use + '>'+ item.coupon_use +'</option>';
							str += '<option value="������">��밡��</option>';
							str += '<option value="�κй�ȯ">���Ұ�</option>';
							str += '</select></li>';
							str += '<li class="listtd"><a class="update">����</a>';
							str += '<a style="display: none;" value="/setak/updateCoupon.do?coupon_seq=' + item.coupon_seq + '" class="after">����</a></li>';
							str += '</ul>';
							$(".coupon_list").append(str);
						});
					},
					error:function(){
						alert("ajax��� ����!!!");
					}
				});
			}
			
			selectData();	
			
			//������ư Ŭ����
			$(document).on('click','.update',function(event) {
				$(".after").css("display","none");
				$(".update").css("display","block");
				$(".coupon_start").attr("disabled","disabled");
				$(".coupon_end").attr("disabled","disabled");
				$(".coupon_useday").attr("disabled","disabled");
				$(".coupon_use").attr("disabled","disabled");
				$(".coupon_start").removeClass("upadte_select");
				$(".coupon_end").removeClass("upadte_select");
				$(".coupon_useday").removeClass("upadte_select");
				$(".coupon_use").removeClass("upadte_select");
				$('.listtd').removeClass("update_count");
				
				$($(this).parent().children(".after")).css("display","block");
				$(this).css("display","none");
				$($(this).parent().parent().children().children('.coupon_start')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_end')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_useday')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_use')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_start')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_end')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_useday')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_use')).addClass("upadte_select");
				$($(this).parent().parent().children('.listtd:nth-child(5)')).addClass("update_count"); //�˾�â ���� �� �ְ� ��
				
								
				//�ٸ� ������ư ������ �� �⺻������ ������ ���ؼ�
				$('#coupon_form')[0].reset();
			});

			
			//���� ajax
			$(document).on('click','.after', function(event){
				var cate = $(this).parents().eq(1).children().eq(12).children().val();
				var kind = $(this).parents().eq(1).children().eq(4).children().val();
				var count = $(this).parents().eq(1).children().eq(5).children().val();
				var box = $(this).parents().eq(1).children().eq(6).children().val();
				var sd = $(this).parents().eq(1).children().eq(7).children().val();
				var fd = $(this).parents().eq(1).children().eq(8).children().val();
				var now = $(this).parents().eq(1).children().eq(9).children().val();
				
				var params = {"keep_cate":cate,"keep_kind":kind,"keep_box":box,"keep_start":sd,"keep_end":fd,"keep_now":now,"keep_count":count}
				
				jQuery.ajax({
					url : $(this).attr("value"), 
					type : 'post',
					data : params,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //�������� ������ ������ Ÿ��
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.keep_list').empty()
							selectData();
						} else {
							alert("���� ����");
						}
					},
					error:function(){
						alert("ajax��� ����");
					}
				});
				event.preventDefault();
			}); 
			
			
			
		});
	</script>
</head>
<body>
		<div id="admin"></div>
		
		<div class="content">
			<!-- ���⼭���� �۾��ϼ���. -->
			<h1>��ü��������</h1>
			
			<!-- ���� -->
			<div id = "search-div">
				<h2>��ü�����˻�</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>ȸ�� �˻�</td>
							<td>
								<input id = "keyword" type = "text" size = "40px" placeholder = "������ �Է����ּ���." /> 
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<input type="button" id = "search-btn" value = "�˻�" onclick = "searchOrder();" />
				</div>
			</div>			
			<!-- ���� �� -->
			
			
			<ul class="coupon_title">
				<li><input type="checkbox" id="allcheck"></li>
				<li>ȸ�����̵�</li>
				<li>�����̸�</li>
				<li>�����ο���¥</li>
				<li>�������ᳯ¥</li>
				<li>������볯¥</li>
				<li>������뿩��</li>
				<li>����</li>
			</ul>
			
			<form id="coupon_form">
				<div class="coupon_list paginated">
					<input type="button" value="���û���" class="checkdelete">
				</div>
			</form>


		</div>
		<!-- ���  div ��-->
	<!-- ������������ -->
</body>
</html>
