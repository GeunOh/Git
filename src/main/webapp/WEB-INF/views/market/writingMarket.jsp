<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
   #body{margin-top: 300px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavender;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif"; margin-left: 11%;}
   hr{border-color: lavender;}
   .inputs{border: none; margin-left: 20px;}
   #tr1{height: 10%}
   #tr2{height: 10%;}
   #tr3{height: 10%;}
   #tr4{height: 60%;}
   #tr5{height: 10%;}
   #tb{width: 60%; height: 600px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavender;}
   
   #content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavender;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div id="body">
      <h2>&nbsp;�߰�����</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form>
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">�ۼ��ϱ�</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">����</td>
                     <td>
                        <input class="inputs" type="text" placeholder="������ �Է��ϼ���" size="90">
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">����</td>
                     <td>
                       <input class="inputs" type="text" placeholder="������ �Է��ϼ���" size="90">
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">����</td>
                     <td>
                        <textarea id="content" placeholder="���� �Է��ϼ��� " style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">��ǰ����</td>
                     <td>
                  <input type="file" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button class="btn">���</button>
                  <button class="btn">�ۼ��Ϸ�</button>
            </div>
         </form>
   </div><br>
</body>
</html>