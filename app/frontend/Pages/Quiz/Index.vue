<template>
  <Head title="Quizzes" />

  <p v-if="flash.notice" class="alert alert-warning">{{ flash.notice }}</p>

  <div class="d-flex justify-content-between">
    <h1 class="my-0">Quizzes</h1>
    <Link href="/quizzes/new" class="btn btn-primary my-auto">New Quiz</Link>
  </div>
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Email</th>
        <th scope="col">Weight</th>
        <th scope="col">Birthdate</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(quiz, index) in quizzes" :key="quiz.id">
        <th scope="row">{{ index }}</th>
        <td>    
          <Link :href="`/quizzes/${quiz.id}`">{{ quiz.email }}</Link>
        </td>
        <td>{{ quiz.weight }}</td>
        <td>{{ quiz.birthdate }}</td>
        <td>
          <Link class="btn btn-danger btn-sm" 
            :href="`/quizzes/${quiz.id}`"
            @click="onDestroy"
            as="button"
            method="delete">
            &times;
          </Link>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Quiz from './Quiz.vue'

const { quizzes, flash } = defineProps(['quizzes', 'flash'])
</script>

