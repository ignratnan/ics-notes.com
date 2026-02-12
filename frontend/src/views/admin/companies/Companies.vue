<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'
import CompaniesContent from '@/views/admin/companies/CompaniesContent.vue'
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