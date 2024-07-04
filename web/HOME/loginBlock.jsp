<%-- 
    Document   : loginBlock
    Created on : May 18, 2024, 9:16:36?AM
    Author     : Desktop
--%>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
 $(document).ready(function (){
//     $("#rightBar").hide();
     
     function toggleRightBar()
     {
         $("#rightBar").toggle();
     }
     $(".nav-user").click(function ()
     {
         toggleRightBar();
     });
 });
</script>
<div id="rightBar">
    <div class="Login" >
        <a style=" color: white; text-decoration:none ;font-size: 12px;text-height: 500">SIGN IN</a>
    </div>
    <div  class="register">
        <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="signUp" > SIGN UP</a>
    </div>
</div>

