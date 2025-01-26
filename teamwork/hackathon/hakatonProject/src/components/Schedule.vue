<template>
  <div>
    <!-- <h2>Интерактивное расписание</h2> -->
    <ul>
      <li v-for="item in schedule" :key="item.idSchedule">
        {{ item.subject }} - {{ item.time }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Schedule",
  data() {
    return {
      schedule: [],
    };
  },
  created() {
    this.fetchSchedule();
  },
  methods: {
    async fetchSchedule() {
      try {
        const response = await axios.get("http://localhost:5062/api/GetList/GetSchedule");
        if (response.status === 200) {
          this.schedule = response.data;
        }
      } catch (error) {
        console.error("Ошибка при загрузке расписания:", error);
      }
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
  margin-bottom: 10px;
}
</style>
