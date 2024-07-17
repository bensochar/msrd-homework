<template>
  <Head title="New Quiz"/>

  <h1>New Quiz</h1>

  <Form
    :user="user"
    submitText="Next"
    @onSubmit="handleSubmit"
  />

</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Form from './StepForm.vue'

const { user } = defineProps(['user'])

const handleSubmit = (form) => {
  form.transform((data) => ({ user: data }))
  form.post('/users')
}
</script>
