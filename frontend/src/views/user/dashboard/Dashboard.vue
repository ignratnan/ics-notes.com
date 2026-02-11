<script setup>
import Sidebar from '@/views/user/layout/Sidebar.vue'
import SidebarBlock from '@/views/user/layout/SidebarBlock.vue'
import DashboardContent from '@/views/user/dashboard/DashboardContent.vue'
</script>

<template>
  <div class="flex flex-row">
    <div>
      
    </div>
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <DashboardContent />
    </div>
  </div>
</template>

<style scoped></style>