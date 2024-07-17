<template>
  <Head title="Users" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>
  <div class="d-flex justify-content-between">
    <h1 class="my-0">Users</h1>
    <Link href="/users/new" class="btn btn-primary my-auto">New Quiz</Link>
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
      <tr v-for="(user, index) in users" :key="user.id">
        <th scope="row">{{ index }}</th>
        <td>    
          <Link :href="`/users/${user.id}`">
            {{ user.email }}
            </Link>
        </td>
        <td>{{ user.weight }}</td>
        <td>{{ user.birthdate }}</td>
        <td>
          <Link class="btn btn-danger btn-sm" 
            :href="`/users/${user.id}`"
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
import User from './User.vue'

const { users, flash } = defineProps(['users', 'flash'])
</script>
