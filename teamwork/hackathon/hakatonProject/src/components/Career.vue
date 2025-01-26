<template>
  <div>
    <h2>Индивидуальный план развития</h2>
    <ul>
      <li v-for="item in userPlans" :key="item.idIdp" class="plan-item">
        <strong>Студент:</strong> {{ item.student }}<br>
        <strong>Цели карьеры:</strong> {{ item.careerGoals }}<br>
        <strong>Навыки для улучшения:</strong> {{ item.skillsToImprove }}<br>
        <strong>Прогресс:</strong> {{ item.progress }}<br>
        <strong>Дата создания:</strong> {{ formatDate(item.createdAt) }}<br>
        <strong>Дата обновления:</strong> {{ formatDate(item.updatedAt) }}<br>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'Career',
  data() {
    return {
      plans: [],
      userPlans: [],
    };
  },
  mounted() {
    axios.get('http://localhost:5062/api/GetList/GetCareerPlan')
      .then(response => {
        this.plans = response.data;
        this.filterUserPlans();
      })
      .catch(error => {
        console.error('Ошибка при получении планов:', error);
      });
  },
  methods: {
    filterUserPlans() {
      const userName = localStorage.getItem('userName');
      this.userPlans = this.plans.filter(plan => plan.student === userName);
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      return date.toLocaleDateString('ru-RU', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      });
    },
  },
};
</script>

<style scoped>
h2 {
  color: #fff;
  margin-bottom: 20px;
}

ul {
  list-style-type: none;
  padding: 0;
}

.plan-item {
  margin-bottom: 20px;
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #333;
  color: #fff;
}

strong {
  font-weight: bold;
}
</style>
