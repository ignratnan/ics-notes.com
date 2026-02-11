<script setup>
import Sidebar from '@/views/user/layout/Sidebar.vue'
import SidebarBlock from '@/views/user/layout/SidebarBlock.vue'
import CompaniesContent from '@/views/user/companies/CompaniesContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <CompaniesContent />
    </div>
  </div>
</template>

<style scoped></style>