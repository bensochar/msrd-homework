<template>
  <Head :title="`User #${user.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>User #{{ user.id }}</h1>

  <User :user="user" />

  <div>
    <Link :href="`/users/${user.id}/edit`">Edit this user</Link> |
    <Link href="/users">Back to users</Link>

    <br />

    <Link
      :href="`/users/${user.id}`"
      @click="onDestroy"
      as="button"
      method="delete">
      Destroy this user
    </Link>
  </div>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import User from './User.vue'

const { user, flash } = defineProps(['user', 'flash'])

const onDestroy = (e) => {
  if (!confirm('Are you sure you want to delete this user?')) {
    e.preventDefault()
  }
}
</script>

<style scoped>
.notice {
  color: green;
}
</style>
