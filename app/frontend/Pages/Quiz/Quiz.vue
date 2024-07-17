<template>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Quiz #{{ quiz.id }}</h5>
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item">
        Email:<br>
        {{ quiz.email }}
      </li>
      <li class="list-group-item">
        Weight:<br>
        {{ quiz.weight }}
      </li>
      <li class="list-group-item">
        Birthdate:<br>
        {{ quiz.birthdate }}
      </li>
    </ul>
  </div>
</template>

<script setup>
const { quiz } = defineProps(['quiz'])
</script>
