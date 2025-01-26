<template>
  <div>
    <!-- <h2>Текущие оценки</h2> -->
    <ul>
      <li v-for="item in grades" :key="item.idGrade">
        <strong>Курс:</strong> {{ item.course }}<br>
        <strong>Студент:</strong> {{ item.student }}<br>
        <strong>Оценка:</strong> {{ item.grade1 }}<br>
        <strong>Комментарии:</strong> {{ item.comments }}<br>
        <strong>Дата:</strong> {{ formatDate(item.gradeDate) }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'Grades',
  data() {
    return {
      grades: [],
    };
  },
  mounted() {
    axios.get('http://localhost:5062/api/GetList/GetGrades')
      .then(response => {
        this.grades = response.data;
      })
      .catch(error => {
        console.error('Ошибка при получении оценок:', error);
      });
  },
  methods: {
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
  color: #333;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 20px;
}

strong {
  font-weight: bold;
}
</style>
