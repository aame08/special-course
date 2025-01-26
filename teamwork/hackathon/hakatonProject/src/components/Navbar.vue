<template>
  <nav>
    <router-link to="/">Главная</router-link>
    <router-link v-if="isAuthenticated && userRole !== 'teacher'" to="/schedule">Расписание</router-link>
    <router-link v-if="isAuthenticated && userRole !== 'teacher'" to="/materials">Учебные материалы</router-link>
    <router-link v-if="isAuthenticated && userRole !== 'teacher'" to="/career">Карьерные возможности</router-link>
    <router-link v-if="isAuthenticated && userRole !== 'teacher'" to="/feedback">Обратная связь</router-link>

    <router-link v-if="isAuthenticated && userRole === 'teacher'" to="/grades">Оценки</router-link>

    <div v-if="isAuthenticated">
      <span>Добро пожаловать, {{ userName }}</span>
      <button @click="logout">Выйти</button>
    </div>

    <router-link v-else to="/login">Войти</router-link>
  </nav>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const isAuthenticated = ref(false);
const userName = ref('');
const userRole = ref('');

const checkAuthentication = () => {
  const userId = localStorage.getItem('userId');
  const nameUser = localStorage.getItem('userName');
  const role = localStorage.getItem('userRole');

  if (userId && nameUser && role) {
    isAuthenticated.value = true;
    userName.value = nameUser;
    userRole.value = role;
  } else {
    isAuthenticated.value = false;
  }
};

onMounted(() => {
  checkAuthentication();
});

const logout = () => {
  localStorage.removeItem('userId');
  localStorage.removeItem('userRole');
  localStorage.removeItem('userName');
  isAuthenticated.value = false;
  userName.value = '';
  userRole.value = '';
  router.push('/login');
};
</script>

<style scoped>
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
}

nav a {
  margin-right: 10px;
  text-decoration: none;
  color: #fff;
}

nav a:hover {
  text-decoration: underline;
}

button {
  padding: 10px 20px;
  background-color: #555;
  color: #fff;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #777;
}

span {
  margin-right: 10px;
}
</style>
