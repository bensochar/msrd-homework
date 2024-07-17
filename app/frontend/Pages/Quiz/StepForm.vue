<template>
  <legend>Please enter your {{ quiz.current_step }}</legend>
  <form @submit.prevent="emit('onSubmit', form)">
    <div v-if="quiz.current_step == 'email'" class="position-relative mb-3">
      <label class="form-label" for="email">Email</label>
      <input autocomplete="email" 
        class="form-control" 
        type="email" 
        name="email" 
        id="email" 
        v-model="form.email">
      <div v-if="form.errors.email" class="invalid-tooltip d-block">
        {{ form.errors.email.join(', ') }}
      </div>
    </div>
    <div v-if="quiz.current_step == 'weight'" class="position-relative mb-3">
      <label class="form-label" for="weight">Weight</label>
      <input class="form-control" 
        type="number" 
        name="weight" 
        id="weight" 
        v-model="form.weight">
      <div v-if="form.errors.weight" class="invalid-tooltip d-block">
        {{ form.errors.weight.join(', ') }}
      </div>
    </div>
    <div v-if="quiz.current_step == 'birthdate'" class="position-relative mb-3">
      <label class="form-label" for="birthdate">Birthdate</label>
      <input autocomplete="birthdate" 
        class="form-control" 
        type="date" 
        name="birthdate" 
        id="birthdate"
        v-model="form.birthdate">
      <div v-if="form.errors.birthdate" class="invalid-tooltip d-block">
        {{ form.errors.birthdate.join(', ') }}
      </div>
    </div>
    <div>
      <button class="btn btn-primary" type="submit" :disabled="form.processing">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { quiz, submitText } = defineProps(['quiz', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  email: quiz.email || '',
  weight: quiz.weight || '',
  birthdate: quiz.birthdate || '',
})
</script>
