<template>
  <Head title="Editing quiz" />

  <h1>Editing {{quiz.id}}</h1>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <Form
        :quiz="quiz"
        submitText="Update quiz"
        @onSubmit="handleSubmit"
      />
    </div>
  </div>

  <ul class="nav">
    <li class="nav-item"><Link class="nav-link" :href="`/quizzes/${quiz.id}`">Show this quiz</Link></li>
    <li class="nav-item"><Link class="nav-link" href="/quizzes">Back to quizzes</Link></li>
  </ul>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Form from './Form.vue'

const { quiz } = defineProps(['quiz'])

const handleSubmit = (form) => {
  form.transform((data) => ({ quiz: data }))
  form.patch(`/quizzes/${quiz.id}`)
}
</script>
