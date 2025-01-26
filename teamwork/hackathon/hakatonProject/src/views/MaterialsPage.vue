<template>
  <div>
    <h1>Учебные материалы</h1>
    <Materials />
  </div>
</template>

<script>
import Materials from '@/components/Materials.vue';

export default {
  name: 'MaterialsPage',
  components: {
    Materials,
  },
};
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
