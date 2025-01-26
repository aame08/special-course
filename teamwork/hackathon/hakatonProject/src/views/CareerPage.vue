<template>
  <div>
    <h1>Карьерные возможности</h1>
    <Career />
  </div>
</template>

<script>
import Career from '@/components/Career.vue';

export default {
  name: 'CareerPage',
  components: {
    Career,
  },
};
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
