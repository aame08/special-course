import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/Home.vue';
import SchedulePage from '@/views/SchedulePage.vue';
import MaterialsPage from '@/views/MaterialsPage.vue';
import GradesPage from '@/views/GradesPage.vue';
import CareerPage from '@/views/CareerPage.vue';
import FeedbackPage from '@/views/FeedbackPage.vue';
import Login from '@/components/Login.vue';
import WelcomePage from '@/views/WelcomePage.vue';

const routes = [
  { path: '/', component: WelcomePage },
  { path: '/schedule', component: SchedulePage },
  { path: '/materials', component: MaterialsPage },
  { path: '/grades', component: GradesPage },
  { path: '/career', component: CareerPage },
  { path: '/feedback', component: FeedbackPage },
  { path: '/login', component: Login },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
