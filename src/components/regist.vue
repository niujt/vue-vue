<template>
     <el-container>
<el-header>
     <el-tag type="info">{{message}}</el-tag>
     <span></span>
</el-header>
<el-main>
    <div style="width:400px;height:200px;margin:0 auto">
    <el-form ref="registform" :rules="rules" :model="login" label-width="80px">
        <el-form-item label="username:" prop="username">
            <el-input v-model="login.username" placeholder="请输入账号，非中文"></el-input>
        </el-form-item>
        <el-form-item label="password:" prop="password">
            <el-input v-model="login.password" type="password" id="password" placeholder="请输入密码，非中文"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="regist('registform')">注册</el-button>
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
            login:{username:'',password:''},
            message:'regist',
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
    //注册
    regist(){
         this.$http.put('/api/regist',this.login).then(response => {
              console.log(response.data);
              if(response.data.RegistStatus=="success"){
                this.$router.push({  //核心语句
                path:'/',   //跳转的路径
                });
              }
              else{
                this.message=response.data.RegistStatus;
              }
         }, response => {
             console.log("error");
         });
    },
    //返回登录页面
    back(){
        this.$router.push({  //核心语句
        path:'/',   //跳转的路径
        });
    }
  
       
    }
}
</script>


  
