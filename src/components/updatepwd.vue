<template>
     <el-container>
<el-header>
     <el-tag type="info">{{message}}</el-tag>
</el-header>
<el-main>
    <div style="width:400px;height:400px;margin:0 auto">
         <el-form ref="updatepwdform"  :model="login" :rules="rule" label-width="70px">
        <el-form-item label="账号:" prop="username">
            <el-input v-model="login.username" placeholder="请输入要修改的账号"></el-input>
        </el-form-item>
        <el-form-item label="密码:" prop="password">
            <el-input v-model="login.password" type="password" id="password" placeholder="请输入新密码，非中文"></el-input>
        </el-form-item>
         <el-form-item label="邮箱:">
            <el-input  id="email" type="text" placeholder="发送验证码的邮箱" style='width:260px'></el-input>
             <el-button style="float:right" type="primary" @click="send()">发送</el-button>
        </el-form-item>
       <el-form-item label="验证码:" prop="code">
            <el-input v-model="login.code" type="text" placeholder="请输入验证码"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="res('updatepwdform')">重置</el-button>
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
            login:{username:'',password:'',code:''},
            message:'修改密码',
            rule:{
                 username:[  
                        { required: true, message: '账号不能为空', trigger: 'blur' }
                    ],
                password:[  
                        { required: true, message: '密码不能为空', trigger: 'blur' }
                    ],
                code:[  
                        { required: true, message: '验证码不能为空', trigger: 'blur' }
                    ],

            }
        }
    },
    mounted:function(){
      
    },
    methods:{
        /**发送验证码 */
        send(){
              var email=document.getElementById('email').value;
              if(email==""||email==null){
                     this.$alert('请输入邮箱', 'Warning', {
                        confirmButtonText: '确定',
                        callback: action => {
                        this.$message({
                        type: 'info',
                        message: `请务必输入正确的邮箱格式QAQ`
                 });
                }
                });
              }
             this.$http.put('/api/forgetPwd?email='+email).then(response => {
                 this.$message('请注意查看您的邮箱！！！');
            console.log(response.data);

         }, response => {
             console.log("error");
              this.$message('邮箱发送失败，请输入正确的邮箱格式！！！');
         });
        },
        /**修改密码 */
        res(formname){
             var _this=this;
            this.$refs[formname].validate((valid) => {
                if(valid){
                   _this.$http.put('/api/updatePwd',this.login).then(response=>{
                       console.log(response.data);
                       _this.message=response.data.LoginStatus;
                   }); 
                }
            });
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
