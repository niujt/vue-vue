<template>
<el-container>
  <el-header width="400px">
   <h5 style="float:right">{{realdate}}</h5>
     <el-breadcrumb separator="/">
      <el-breadcrumb-item :to="{ path: 'user' }">用户信息</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: 'city' }">城市信息</el-breadcrumb-item>
    </el-breadcrumb>
 <el-button type="primary" style="float:right" @click="loginout()">loginout</el-button>
  </el-header>
      <el-main>
     <h2><img :src="headurl" style="wdith:80px;height:80px;border-radius:50px"> welcome！！！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户：{{userName}} {{id}} </h2>
      <el-tabs type="border-card" style='width:1000px;margin:0 auto'>
      <el-tab-pane label="基本资料" >
        <!--基本资料  :model="user"-->
        <el-form ref="infoform"  label-width="80px">
          <el-form-item label="姓名" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="手机" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="部门" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="职位" style='width:400px'>
              <el-input></el-input>
          </el-form-item>
           <el-form-item label="生日" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="性别" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="地址" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="QQ" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" >保存</el-button>
            <el-button>更新</el-button>
          </el-form-item>
        </el-form>
        <!--基本资料-->
      </el-tab-pane>
      <el-tab-pane label="头像设置">
        <!--头像设置-->
        <h5 style='text-align:center'>添加或修改头像：</h5>
        <el-upload
        class="avatar-uploader"
        action='/api/userUpload'
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload" style='margin:0 auto'>
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
        <!--头像设置-->
      </el-tab-pane>
      <el-tab-pane label="教育经历">
        <el-form ref="infoform"   label-width="150px">
          <el-form-item label="小学" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="初中" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="高中" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="大学" style='width:400px'>
              <el-input></el-input>
          </el-form-item>
           <el-form-item label="研究生及以上" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
           <el-form-item label="是否有出国经历" style='width:400px'>
              <el-input ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" >保存</el-button>
            <el-button>更新</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
</el-tabs>
      </el-main>
      <el-footer>author @jtniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我</el-footer>
</el-container>
</template>

<script>
export default {
  data () {
    return {
      userName:'',
      id:'',
      imageUrl: '',
      realdate:'',
      headurl:require("../assets/1546146191588.jpg")
      }
  },
  mounted:function(){
  this.showDate();
   setInterval(this.showDate,1000);
   this.initDate();
  },
  methods:{
    initDate(){
        this.$http.get('/api/logininfo').then(response => {
          console.log(response.data.logininfo)
              var logindate=response.data.logininfo;
             this.userName=logindate.username;
            this.id=logindate.userid;
         }, response => {
             console.log("error");
         });
    },
    loginout(){
       this.$http.get('/api/loginout').then(response => {
              console.log(response.data.LoginStatus);
               this.$router.push({  //核心语句
            path:'/',   //跳转的路径
            });
         }, response => {
             console.log("error");
         });
    },
    handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      showDate(){
        var date=new Date();
        this.realdate=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+
        "    "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
      }

  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
    border:1px dotted #ccc;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }

</style>
