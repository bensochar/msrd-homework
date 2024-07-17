<template>
  <div>
    <p>
      <strong>Email:</strong>
      {{ user.email }}
    </p>
    <p>
      <strong>Weight:</strong>
      {{ user.weight }}
    </p>
    <p>
      <strong>Birthdate:</strong>
      {{ user.birthdate }}
    </p>
  </div>
  {{ user.current_step }}
</template>

<script setup>
const { user } = defineProps(['user'])
</script>
