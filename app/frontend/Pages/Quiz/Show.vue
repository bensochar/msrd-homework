<template>
  <Head :title="`Quiz #${quiz.id}`" />

  <p v-if="flash.notice" class="alert alert-warning">{{ flash.notice }}</p>

  <h1>Quiz #{{ quiz.id }}</h1>
  <div class="row justify-content-center">
    <div class="col-md-4">
      <Quiz :quiz="quiz" />
    </div>
  </div>
  <ul class="nav">
    <li class="nav-item"><Link class="nav-link" href="/quizzes">Back to quizzes</Link></li>
    <li class="nav-item"><Link class="nav-link" :href="`/quizzes/${quiz.id}/edit`">Edit this quiz</Link></li>
    <li class="nav-item">
      <Link class="nav-link text-danger"
        :href="`/quizzes/${quiz.id}`"
        @click="onDestroy"
        as="button"
        method="delete">Destroy this quiz</Link>
    </li>
  </ul>

</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Quiz from './Quiz.vue'

const { quiz, flash } = defineProps(['quiz', 'flash'])

const onDestroy = (e) => {
  if (!confirm('Are you sure you want to delete this quiz?')) {
    e.preventDefault()
  }
}
</script>

<style scoped>
.notice {
  color: green;
}
</style>
