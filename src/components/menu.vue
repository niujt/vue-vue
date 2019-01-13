<template>
 <div>
      <h5 style="float:right">{{realdate}}&nbsp;&nbsp;&nbsp;&nbsp;<el-button  type="primary" @click="loginout()">loginout</el-button></h5>
     <div  style="float:left">
     <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
  <el-radio-button :label="false">展开</el-radio-button>
  <el-radio-button :label="true">收起</el-radio-button>
</el-radio-group>
<el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
  <el-menu-item index="1" @click="showIndex()">
       <i class="el-icon-document"></i>
       <span slot="title">用户信息</span>
  </el-menu-item>
    <el-submenu index="2">
    <template slot="title">
      <i class="el-icon-menu"></i>
      <span slot="title">系统管理</span>
    </template>
    <el-menu-item-group title="系统">
        <el-menu-item index="2-1" @click="showCity()">城市管理</el-menu-item>
        <el-menu-item index="2-2" @click="showUser()" >用户管理</el-menu-item>
        <el-menu-item index="2-3"  >省份管理</el-menu-item>
    </el-menu-item-group>
  </el-submenu>
  <el-menu-item index="3" disabled>
    <i class="el-icon-setting"></i>
    <span slot="title">XXX</span>
  </el-menu-item>
</el-menu>
</div>
</div>    
</template>
<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 250px;
    min-height: 400px;
  }
</style>
<script>
export default {
    data(){
        return{
            isCollapse: false,
            realdate:''
        }
         
    },
    mounted:function(){
    this.showDate();
    setInterval(this.showDate,1000);

  },
    methods:{
         //显示日期
      showDate(){
        var date=new Date();
        this.realdate=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+
        "    "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
      },
         //导航条展开
       handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      //当行条收缩
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      },
      //显示首页（用户信息）
      showIndex(){
        console.log("显示用户信息");
        this.$router.push({name: 'index'});
      },
      //显示城市列表
      showCity(){
        console.log("显示城市列表");
        this.$router.push({name: 'Citylist'});
      },
      //显示用户列表
      showUser(){
        console.log("显示用户信息");
        this.$router.push({name: 'Userlist'});
      }
    }
}
</script>


