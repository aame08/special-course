<template>
  <div>
    <h2>Хранилище материалов</h2>
    <ul>
      <li v-for="item in materials" :key="item.idMaterial">
        <strong>{{ item.materialType }}</strong><br>
        <span><strong>Курс:</strong> {{ item.course }}</span><br>
        <span><strong>Название:</strong> {{ item.title }}</span><br>
        <a :href="item.fileUrl" target="_blank">Скачать</a><br>
        <small>Загружено: {{ formatDate(item.uploadDate) }}</small>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'Materials',
  data() {
    return {
      materials: [],
    };
  },
  created() {
    this.fetchMaterials();
  },
  methods: {
    async fetchMaterials() {
      try {
        const response = await axios.get("http://localhost:5062/api/GetList/GetMaterials");
        if (response.status === 200) {
          this.materials = response.data;
        }
      } catch (error) {
        console.error("Ошибка при загрузке материалов:", error);
      }
    },
    formatDate(dateString) {
      const options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' };
      return new Date(dateString).toLocaleDateString("ru-RU", options);
    }
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

a {
  color: #0066cc;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

small {
  color: #666;
}
</style>
