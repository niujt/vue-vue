<template>
    <el-container>
<el-header>
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <router-link to="/index" style="float:left;text-decoration:none" class="el-icon-back">
        </router-link>
        用户信息
    </h1>
</el-header>
<el-main>
   <el-table
   order size="mini" fit highlight-current-row height="500" :data='tableDate'>
    <el-table-column type="index" label="序号" fixed sortable></el-table-column>
    <el-table-column label="id" prop='id' v-if='false'></el-table-column>
    <el-table-column label='姓名' prop='name' sortable></el-table-column>
    <el-table-column label='年龄' prop='age' sortable></el-table-column>
    <el-table-column label='性别' prop='sex' sortable></el-table-column>
    <el-table-column label='邮箱' prop='email' width="200px" sortable></el-table-column>
    <el-table-column label='手机号' prop='phone'></el-table-column>
    <el-table-column label='小学学历' prop='education1' show-overflow-tooltip sortable></el-table-column>
    <el-table-column label='初中学历' prop='education2' show-overflow-tooltip sortable></el-table-column>
    <el-table-column label='高中学历' prop='education3' show-overflow-tooltip sortable></el-table-column>
    <el-table-column label='大学学历' prop='education4' show-overflow-tooltip sortable></el-table-column>
    <el-table-column label='是否研究生及以上' prop='ishigheducation' width="200px" sortable></el-table-column>
     <el-table-column label='部门职位' prop='deptposition' show-overflow-tooltip></el-table-column>
    <el-table-column label='月薪(元)' prop='salary' ></el-table-column>
    <el-table-column label='地址' prop='address' show-overflow-tooltip></el-table-column>
     <el-table-column label='创建时间' prop='createtime'></el-table-column>
    <el-table-column
              fixed="right"
              label="操作"
              width="195">
              <template slot-scope="scope">
                <el-button @click="upd(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">编辑
                </el-button>
                <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="del(scope.row)">删除
                </el-button>        
    </template>
    </el-table-column>
   </el-table> 
</el-main>
</el-container>
</template>
<script>
export default {
    data(){
        return{
            tableDate:[]
        }
    },
    mounted:function() {
        this.initData();
    },
    methods:{
        initData(){
        this.$http.get('/api/user').then(response => {
              console.log(response.data.users);
             this.tableDate=response.data.users;
             console.log( this.tableDate);
             this.tableDate.forEach(item=>{
                 if(item.sex==2){
                     item.sex='女';
                 }
                 else{
                     item.sex='男';
                 }
                  if(item.ishigheducation==0){
                     item.ishigheducation='否';
                 }
                 else{
                     item.ishigheducation='是';
                 }
                console.log(item.createtime);
             })
             
            
         }, response => {
             console.log("error");
         });
        } ,
        upd(row){
            console.log(row.id);
        },
        del(row){
            console.log(row.id);
        }  

        }

}
</script>
