<template>
  <div>
    <h1>Обратная связь</h1>
    <Feedback />
  </div>
</template>

<script>
import Feedback from '@/components/Feedback.vue';

export default {
  name: 'FeedbackPage',
  components: {
    Feedback,
  },
};
</script>

<style scoped>
h1 {
  color: #333;
}
</style>
