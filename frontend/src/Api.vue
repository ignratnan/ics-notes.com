<template>
  <div>
    <h1>Users from PostgreSQL</h1>
    <ul>
      <li v-for="user in users" :key="user.id">
        {{ user.name }} - {{ user.email }}
      </li>
    </ul>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

const users = ref([])

onMounted(async () => {
  try {
    const res = await axios.get('http://localhost:8080/api/users')
    users.value = res.data
  } catch (err) {
    console.error('Error fetching users:', err)
  }
})
</script>
