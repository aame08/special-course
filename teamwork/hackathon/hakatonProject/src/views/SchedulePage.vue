<template>
  <div>
    <h1>Расписание занятий</h1>
    <Schedule />
  </div>
</template>

<script>
import Schedule from '@/components/Schedule.vue';

export default {
  name: 'SchedulePage',
  components: {
    Schedule,
  },
};
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
