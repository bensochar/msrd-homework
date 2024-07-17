<template>
  <Head title="Editing Quiz" />

  <h1>Editing Quiz</h1>

  <Form
    :user="user"
    submitText="Update Quiz"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link :href="`/users/${user.id}`">Show this user</Link> |
    <Link href="/users">Back to users</Link>
  </div>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Form from './Form.vue'

const { user } = defineProps(['user'])

const handleSubmit = (form) => {
  form.transform((data) => ({ user: data }))
  form.patch(`/users/${user.id}`)
}
</script>
