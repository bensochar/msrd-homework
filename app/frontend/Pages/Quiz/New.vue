<template>
  <Head title="New quiz" />

  <h1>New quiz</h1>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <Form
        :quiz="quiz"
        submitText="Next"
        @onSubmit="handleSubmit"
      />
    </div>
  </div>

  <ul class="nav">
    <li class="nav-item"><Link class="nav-link" href="/quizzes">Back to quizzes</Link></li>
  </ul>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Form from './StepForm.vue'

const { quiz } = defineProps(['quiz'])

const handleSubmit = (form) => {
  form.transform((data) => ({ quiz: data }))
  form.post('/quizzes')
}
</script>
