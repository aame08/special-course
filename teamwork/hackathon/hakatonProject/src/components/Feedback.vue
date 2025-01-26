<template>
  <div>
    <h2>Форма обратной связи</h2>
    <form @submit.prevent="submitFeedback">
      <select v-model="selectedCourse" required>
        <option disabled value="">Выберите курс</option>
        <option v-for="course in courses" :key="course.idCourse" :value="course.idCourse">
          {{ course.nameCourse }}
        </option>
      </select>

      <textarea v-model="feedback" placeholder="Ваш отзыв" required></textarea>
      <button type="submit">Отправить</button>
    </form>

    <p v-if="message">{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Feedback',
  data() {
    return {
      feedback: '',
      selectedCourse: '',
      message: '',
      courses: []
    };
  },
  methods: {
    submitFeedback() {
      const studentId = localStorage.getItem('userId');
      const courseId = this.selectedCourse;
      const feedbackText = this.feedback;

      if (!feedbackText || !courseId) {
        this.message = "Пожалуйста, выберите курс и введите ваш отзыв!";
        return;
      }

      axios.post('http://localhost:5062/api/GetList/SubmitFeedback', {
        studentId,
        idCourse: courseId,
        feedbackText
      })
      .then(response => {
        this.message = response.data.message;
        this.feedback = '';
        this.selectedCourse = '';
      })
      .catch(error => {
        console.error('Ошибка отправки отзыва:', error);
        this.message = 'Произошла ошибка при отправке отзыва. Попробуйте еще раз.';
      });
    },
    loadCourses() {
      axios.get('http://localhost:5062/api/GetList/GetCourses')
        .then(response => {
          this.courses = response.data;
        })
        .catch(error => {
          console.error('Ошибка загрузки курсов:', error);
        });
    }
  },
  mounted() {
    this.loadCourses();
  }
};
</script>

<style scoped>
h2 {
  color: #fff;
}

form {
  margin-top: 20px;
}

select,
textarea {
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

p {
  margin-top: 20px;
  color: #28a745;
  font-weight: bold;
}
</style>
