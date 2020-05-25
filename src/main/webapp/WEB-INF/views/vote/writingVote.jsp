<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #body{margin-top: 300px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavender;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif"; margin-left: 11%;}
   hr{border-color: lavender;}
   .inputs{border: none; margin-left: 20px;}
   #tr1{height: 10%}
   #tr2{height: 5%;}
   #tr3{height: 40%;}
   #tr4{height: 40%;}
   #tr5{height: 5%;}
   #tb{width: 60%; height: 700px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavender;}
    #list li{list-style-type: decimal-leading-zero;} 
   .content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavender;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div id="body">
      <h2>&nbsp;��ǥ</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form>
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">�ۼ��ϱ�</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">����</td>
                   <td>
                      <input class="inputs" type="text" placeholder="������ �Է��ϼ���" size="60">
                   </td>
                   <td class="td1">��ǥ�Ⱓ</td>                   
                   <td>
                      <input class="inputs" type="date">����<input class="inputs" type="date">����
                   </td>
                </tr>
                  <tr id="tr3">
                     <td class="td1">��ǥ����</td>
                     <td colspan=3>
                        <textarea class="content" placeholder="��ǥ������ �Է��ϼ��� " style="margin-left: 20px;">

                        </textarea>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">��ǥ�ĺ�</td>
                     <td colspan=3>
                     	<div>
                     		<input type="checkbox"><label>�ߺ� ���� ���</label><br>
                     		<ol id="list" type='1'>
                     			<li><input type="text"></li>
                     			<li><input type="text"></li>
                     			
                     			<li><button type="button" id="add" onclick="add();">�ĺ� �߰�</button></li>
                     		</ol>
                     	</div>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">÷������</td>
                     <td colspan=3>
                  <input type="file" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      
            </table><br>
	<script type="text/javascript">
		
	</script>
              <div id="btns">
                  <button class="btn">���</button>
                  <button class="btn">�ۼ��Ϸ�</button>
            </div>
         </form>
   </div><br>
</body>
</html>