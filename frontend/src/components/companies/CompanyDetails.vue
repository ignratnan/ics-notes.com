<template>
    <div class="flex flex-row">
    <div>
      <SidebarBlock />
      <Sidebar />
    </div>
    <div class="w-full">
      <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    COMPANIES <font-awesome-icon icon="angle-right" />
                    DETAILS-COMPANY
                </h1>
                <hr>
            </div>
            <div class="max-w mb-5 bg-black">
                <div class="px-2 divide-y divide-gray-100 overflow-hidden rounded-lg border border-gray-200 bg-white shadow-sm">
                    <div class="my-1 p-3 font-bold underline text-2xl text-gray-800 border-gray-200 shadow-md">
                        {{ company.company_name }}
                    </div>
                    <div>
                        <div class="bg-gray-50 py-2">
                            <div class="font-normal text-base text-gray-800">
                                <div class="flex flex-row mt-1">
                                    <div><font-awesome-icon icon="building" /></div>
                                    <div class="ml-1 w-32">Country</div>
                                    <div>:</div>
                                    <div class="ml-2 break-words">
                                        {{ company.company_country }} 
                                    </div>
                                </div>
                                <div class="flex flex-row mt-1">
                                    <div><font-awesome-icon icon="user-tie" /></div>
                                    <div class="ml-1 w-32">Agent Type</div>
                                    <div>:</div>
                                    <div class="ml-2 break-words">
                                        {{ company.agent_type }} 
                                    </div>
                                </div>
                                <div class="flex flex-row mt-1">
                                    <div><font-awesome-icon icon="tag" /></div>
                                    <div class="ml-1 w-32">Business Source</div>
                                    <div>:</div>
                                    <div class="ml-2 break-words">
                                        {{ company.business_source }} 
                                    </div>
                                </div>                            
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            
        </div>
    </div>
    </div>
  </div>
    
</template>

<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'

import { onMounted, reactive, ref } from 'vue'
import axios from 'axios'
import { useRoute, useRouter } from 'vue-router'

const route = useRoute()

const company = ref({})

const BASE_URL = 'http://localhost:8080'

const fetchCompany = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/companies/${route.params.id}`)
        company.value = res.data.company

    } catch (err) {
        console.error(err)
    }
}

onMounted(fetchCompany)
</script>