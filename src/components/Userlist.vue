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
    <el-table-column label="id" prop='id'></el-table-column>
    <el-table-column label='name' prop='name'></el-table-column>
    <el-table-column label='age' prop='age'></el-table-column>
    <el-table-column label='salary' prop='salary'></el-table-column>
    <el-table-column label='address' prop='address'></el-table-column>
    <el-table-column
              fixed="right"
              label="操作"
              width="195">
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
         }, response => {
             console.log("error");
         });
        }    
        }

}
</script>
