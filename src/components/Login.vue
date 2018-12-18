<template>
     <el-container>
<el-header>
     <el-tag type="info">{{message}}</el-tag>
     <span></span>
</el-header>
<el-main>
    <div style="width:400px;height:200px;margin:0 auto">
    <el-form ref="loginform" :model="login" label-width="80px">
        <el-form-item label="username:">
            <el-input v-model="login.username"></el-input>
        </el-form-item>
        <el-form-item label="password:">
            <el-input v-model="login.password"></el-input>
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
            message:'login'
        }
      
    },
    methods:{
        onSubmit(formname){
             var _this=this;
             this.$refs[formname].validate((valid) => {
                  if(valid){
                    _this.$http.get('/api/login?username='+this.login.username+"&password="+this.login.password).then(response=>{
                        console.log(response.data);
                        if(response.data.LoginStatus=='success'){
                             this.$router.push({name: 'index'});
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
        onRejest(){
            this.$alert('尚未开发', '注册', {
            confirmButtonText: '确定',
            callback: action => {
            this.$message({
            type: 'info',
            message: `action: '已关闭'`
            });
          }
        });
        }
    }
}
</script>


  
