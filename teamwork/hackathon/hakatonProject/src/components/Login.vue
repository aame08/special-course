<template>
  <div>
    <h1>Вход</h1>
    <form @submit.prevent="authorize">
      <input type="text" v-model="emailUser" placeholder="Имя пользователя" required />
      <input type="password" v-model="passwordUser" placeholder="Пароль" required />
      <button type="submit">Войти</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import axios from "axios";

const router = useRouter();
const emailUser = ref('');
const passwordUser = ref('');
const userMessage = ref('');
const userInfo = ref(null);

const authorize = async () => {
  try {
    const response = await axios.post(`http://localhost:5062/api/Auth/LogIn`, {
      email: emailUser.value,
      password: passwordUser.value
    });

    if (response.status === 200) {
      userMessage.value = response.data.message;
      userInfo.value = response.data.user;

      // Сохраняем данные в localStorage
      localStorage.setItem('userId', userInfo.value.idUser);
      localStorage.setItem('userRole', userInfo.value.nameRole); // Сохраняем роль
      localStorage.setItem('userName', userInfo.value.nameUser);

      // Перенаправляем на главную страницу
      router.push('/');
    }
  } catch (error) {
    userMessage.value = error.response?.data?.message || 'Ошибка авторизации';
  }
};
</script>

<style scoped>
h1 {
  color: #333;
}

form {
  margin-top: 20px;
}

input {
  display: block;
  width: 100%;
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

button {
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #555;
}
</style>
