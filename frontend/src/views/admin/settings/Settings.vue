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
                            SETTINGS
                        </h1>
                        <hr>
                    </div>

                    <div :class="messageClass" name="message" class="mt-2 p-2">
                        {{ message }}
                    </div>

                    <div class="p-4 my-2">
                        <div class="font-bold text-xl text-gray-800">
                            General:
                        </div>
                        <div class="flex flex-row my-2">
                            <div>
                                <button @click="openResetPasswordModal" type="button" class="mx-2 flex items-center h-32 w-40 border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="key" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Reset Password</div>
                                    </div>
                                </button>
                            </div>
                        </div>
                        <hr class="my-3">
                        <div class="font-bold text-xl text-gray-800">
                            One Time Used:
                        </div>
                        <div class="flex flex-row my-2">
                            <div>
                                <button @click="migrateNotes" type="button" class="mx-2 flex items-center h-32 w-40 border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="note-sticky" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Re-build Notes</div>
                                    </div>
                                </button>
                            </div>

                            <div>
                                <button @click="migrateCompanies" type="button" class="mx-2 flex items-center h-32 w-40 border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="building" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Re-build Companies</div>
                                    </div>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div :class="rePassModal">
                <div class="fixed top-0 bottom-0 right-0 left-0 m-0 bg-black opacity-[.30]">
                </div>

                <div class="fixed top-0 bottom-0 right-0 left-0 m-0">
                    <div class="flex h-full w-full justify-center items-center">
                        <div class="py-4 px-6 bg-white w-1/3 rounded-md border-2 shadow-md">
                            <div class="flex justify-center">
                                <h2 class="font-bold text-base text-gray-800">
                                    RESET PASSWORD
                                </h2>
                            </div>
                            <hr class="my-2">
                            <form @submit.prevent="resetPassword">
                                <div class="mt-4 mb-4">
                                    <label for="old-password" class="block text-gray-700 text-sm font-bold my-2">
                                        Old Password
                                    </label>
                                    <input v-model="repass.old_password" type="password" required
                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        id="old-password" placeholder="Enter the old password">
                                </div>
                                <div class="mt-4 mb-4">
                                    <label for="new-password" class="block text-gray-700 text-sm font-bold my-2">
                                        New Password
                                    </label>
                                    <input v-model="repass.new_password" type="password" required
                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        id="new-password" placeholder="Enter the new password">
                                </div>
                                <div class="mt-4 mb-4">
                                    <label for="confirm-password" class="block text-gray-700 text-sm font-bold my-2">
                                        Confirm
                                    </label>
                                    <input v-model="repass.confirm_password" type="password" required
                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        id="confirm-password" placeholder="Re-enter the new password">
                                </div>
                                <hr class="my-2">
                                <div class="flex flex-row justify-around">
                                    <button @click="closeResetPasswordModal" type="button"
                                        class="inline-flex justify-center w-2/6 rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Cancel
                                    </button>
                                    <button type="submit"
                                        class="inline-flex justify-center w-2/6 rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </div>
                                <div :class="repassMessageClass" name="message" class="mt-2 p-2">
                                    {{ repassMessage }}
                                </div>
                            </form>
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

import { onMounted, ref, reactive } from 'vue'
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();
const BASE_URL = 'http://localhost:8080'

const message = ref('')
const messageClass = ref('hidden')
const repassMessage = ref('')
const repassMessageClass = ref('hidden')

const rePassModal = ref('hidden')

const repass = reactive({
    old_password: "",
    new_password: "",
    confirm_password: "",
})

const migrateNotes = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/migrate-notes`);

        message.value = res.data.message
        messageClass.value = 'bg-green-100 text-green-700';


    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
    }
}

const migrateCompanies = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/migrate-companies`);

        message.value = res.data.message
        messageClass.value = 'bg-green-100 text-green-700';

    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
    }
}

const openResetPasswordModal = (id) => {
    repass.old_password = ''
    repass.new_password = ''
    repass.confirm_password = ''
    rePassModal.value = ''
}

const closeResetPasswordModal = () => {
    repass.old_password = ''
    repass.new_password = ''
    repass.confirm_password = ''
    rePassModal.value = 'hidden'
}

const resetPassword = async () => {
    if (repass.new_password == repass.confirm_password) {
        try {
            const url = `${BASE_URL}/reset-password-by-user`;
            const res = await axios.put(url, repass)

            message.value = res.data.message
            messageClass.value = 'bg-green-100 text-green-700'
            
            repass.old_password = ''
            repass.new_password = ''
            repass.confirm_password = ''
            rePassModal.value = 'hidden'
        } catch (error) {
            console.error("Logout failed, but proceeding with redirect:", error);
            repassMessage.value = error.response?.data?.error || 'An unexpected error occurred.';
            repassMessageClass.value = 'bg-red-100 text-red-700'

        }

    } else {
        repass.old_password = ''
        repass.new_password = ''
        repass.confirm_password = ''

        repassMessage.value = 'New and confirm password should be the same!'
        repassMessageClass.value = 'bg-red-100 text-red-700'
    }
    
}

</script>

<style scoped></style>