<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>用户：{{userName}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎！！！</h2>
    <el-carousel :interval="5000" arrow="always">
    <el-carousel-item>
        <router-link to="user" style="text-decoration:none;font-size:40px" >
          用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户<br>信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;息
        </router-link>
    </el-carousel-item>
    <el-carousel-item >
         <router-link to="city" style="text-decoration:none;font-size:40px">
          城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市<br>信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;息
        </router-link>
    </el-carousel-item>
  </el-carousel>
    <!-- <ul>
      <li>
       <router-link to="user" style="text-decoration:none">
          用户信息
        </router-link>
      </li>
      <li>
       <router-link to="city" style="text-decoration:none">
          城市信息
        </router-link>
      </li>
    </ul> -->
  </div>
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
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
