<template>
  <div>
    <h1>Оценки и успеваемость</h1>
    <Grades />
  </div>
</template>

<script>
import Grades from '@/components/Grades.vue';

export default {
  name: 'GradesPage',
  components: {
    Grades,
  },
};
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
