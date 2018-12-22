<template>
<el-container>
  <el-header width="400px">
   
     <el-breadcrumb separator="/">
      <el-breadcrumb-item :to="{ path: 'user' }">用户信息</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: 'city' }">城市信息</el-breadcrumb-item>
</el-breadcrumb>
 <el-button type="primary" style="float:right" @click="loginout()">loginout</el-button>
  </el-header>
      <el-main>
         <h1>{{ msg }} </h1>
     <h2>用户：{{userName}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎！！！</h2>
      </el-main>
      <el-footer>author @jtniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我</el-footer>
</el-container>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to my vue-App',
      userName:''
    }
  },
  mounted:function(){
    this.userName=this.$route.params.username;
  },
  methods:{
    loginout(){
       this.$http.get('/api/loginout').then(response => {
              console.log(response.data.LoginStatus);
               this.$router.push({  //核心语句
            path:'/',   //跳转的路径
            });
         }, response => {
             console.log("error");
         });
    }
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
