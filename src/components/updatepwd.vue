<template>
     <el-container>
<el-header>
     <el-tag type="info">修改密码</el-tag>
</el-header>
<el-main>
    <div style="width:400px;height:200px;margin:0 auto">
         <el-form ref="updatepwdform"  :model="login" label-width="70px">
        <el-form-item label="username:" prop="username">
            <el-input v-model="login.username" placeholder="请输入要修改的账号"></el-input>
        </el-form-item>
        <el-form-item label="password:" prop="password">
            <el-input v-model="login.password" type="password" id="password" placeholder="请输入新密码，非中文"></el-input>
        </el-form-item>
         <el-form-item label="email:">
            <el-input  id="email" type="text" placeholder="发送验证码到邮箱" style='width:260px'></el-input>
             <el-button style="float:right" type="primary" @click="send('')">发送</el-button>
        </el-form-item>
       
        <el-form-item>
            <el-button type="primary" @click="res('')">重置</el-button>
            <el-button type="primary" @click="back()">返回</el-button>
        </el-form-item>
     </el-form>

    </div>
</el-main>
     </el-container>
</template>
<script>
export default {
    data(){
        return{
            login:{username:'',password:''}
        }
    },
    mounted:function(){
      
    },
    methods:{ 
        /**发送验证码 */
        send(){
              var email=document.getElementById('email').value;
              console.log(email);
             this.$http.put('/api/forgetPwd?email='+email).then(response => {
            console.log(response.data);
         }, response => {
             console.log("error");
         });
        },
        /**修改密码 */
        res(){
            alert('修改密码');
        },
        /**返回 */
        back(){
            this.$router.push({ 
                path:'/',
            });
        }
    }
}
</script>
