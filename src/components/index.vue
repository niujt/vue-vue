<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2></h2>
    <ul>
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
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to my vue-App'
    }
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
