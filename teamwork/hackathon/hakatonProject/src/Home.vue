<template>
    <div>
      <Navbar class="navbar" />
      <main>
        <router-view></router-view>
      </main>
    </div>
  </template>
  
  <script>
  import Navbar from './components/Navbar.vue';
  
  export default {
    name: 'Home',
    components: {
      Navbar,
    },
  };
  </script>
  
  <style scoped>
  .navbar {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
  }
  
  main {
    padding: 20px;
    margin-top: 60px;
  }
  </style>
  