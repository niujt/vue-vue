<template>
     <el-container>
<el-header>
     <el-tag type="info">{{message}}</el-tag>
     <span></span>
</el-header>
<el-main>
    <div style="width:400px;height:200px;margin:0 auto">
    <el-form ref="loginform" :rules="rules" :model="login" label-width="80px">
        <el-form-item label="username:" prop="username">
            <el-input v-model="login.username"></el-input>
        </el-form-item>
        <el-form-item label="password:" prop="password">
            <el-input v-model="login.password" type="password" id="password"></el-input><i @click="showpwd('password')" class="el-icon-view" style="margin-left: -30px;margin-top:10px;position: absolute;"></i>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit('loginform')">登录</el-button>
            <el-button type="primary" @click="onRejest">注册</el-button>
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
            login:{username:'',password:''},
            message:'login',
            //表单验证=======账号密码的非空判断
            rules:{
                username:[
                {required: true, message: '账号不能为空', trigger: 'blur' }],
                password:[
                {required: true, message: '密码不能为空', trigger: 'blur' }]
                }
        }
      
    },
    methods:{
        //登录
        onSubmit(formname){
             var _this=this;
             this.$refs[formname].validate((valid) => {
                  if(valid){
                    _this.$http.get('/api/login?username='+this.login.username+"&password="+this.login.password).then(response=>{
                        console.log(response.data);
                        if(response.data.LoginStatus=='success'){
                             this.$router.push({name: 'index',params:{
                            username: _this.login.username
                        }
                        });
                        }
                        else{
                            this.message=response.data.LoginStatus;
                            // this.$router.push({name: 'login'});
                        }
                       //,params:{name:this.login.username}
                    }); 
                  }
             });
        },
        //注册
        onRejest(){
            this.$router.push({  //核心语句
            path:'/regist',   //跳转的路径
            });
        },
        //密码显示隐藏
        showpwd(flag){
            var pwd=document.getElementById("password");
            if(flag=='password'){
                pwd.setAttribute("type","text");
            }
            
        }
    }
}
</script>


  
