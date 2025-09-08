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
                        NOTES <font-awesome-icon icon="angle-right" />
                        CREATE
                    </h1>
                    <hr>
                </div>
                <a href="/formInputEventNote">
                    <button type="button"
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Create New Event
                    </button>
                </a>
                <a href="/formInputContactNote" class="ml-4">
                    <button type="button"
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Create New Contact
                    </button>
                </a>
                <form>
                    <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                        <label for="event_id"
                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-700">Event</label>
                        <div class="flex flex-row">
                            <select
                                class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                <option value=0 selected>Select Event</option>
                                    <option value="">Event name</option>
                            </select>
                        </div>
                        <label for="company_id"
                            class="block mt-2 mb-2 text-sm font-medium text-gray-900 dark:text-gray-700">Company</label>
                        <div class="flex flex-row">
                            <select
                                class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                <option value=0 selected>Select Company</option>
                                <option value="">Company name</option>
                            </select>
                        </div>

                        <div class="">
                            <label for="contacts_id"
                                class="block mt-2 mb-2 text-sm font-medium text-gray-900 dark:text-gray-700">Contact
                            </label>
                            <div class="flex flex-row items-center">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0  selected>Select Contact 1</option>
                                    <option value="">Full name 1</option>
                                </select>
                            </div>
                            <div class="flex flex-row items-center mt-1 ml-3">
                                <button type="button"
                                        class="inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="plus" />
                                </button>
                            </div>

                            <div class="flex flex-row items-center mt-1">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 selected>Select Contact 2</option>
                                    <option value="">Full name 2</option>
                                </select>
                            </div>
                            <div class="flex flex-row items-center mt-1 ml-3">
                                <button type="button"
                                        class="inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="plus" />
                                </button>
                                <button type="button"
                                        class="ml-3 inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="minus" />
                                </button>
                            </div>

                            <div class="flex flex-row items-center mt-1">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 selected>Select Contact 3</option>
                                    <option value="">Full name 3</option>
                                </select>
                            </div>
                            <div class="flex flex-row items-center mt-1 ml-3">
                                <button type="button"
                                        class="inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="plus" />
                                </button>
                                <button type="button"
                                        class="ml-3 inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="minus" />
                                </button>
                            </div>

                            <div class="flex flex-row items-center mt-1">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 selected>Select Contact 4</option>
                                    <option value="">Full name 4</option>
                                </select>
                            </div>
                            <div class="flex flex-row items-center mt-1 ml-3">
                                <button type="button"
                                        class="inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="plus" />
                                </button>
                                <button type="button"
                                        class="ml-3 inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="minus" />
                                </button>
                            </div>

                            <div class="flex flex-row items-center mt-1">
                                <select
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 selected>Select Contact 5</option>
                                    <option value="">Full name 5</option>
                                </select>
                            </div>
                            <div class="flex flex-row items-center mt-1 ml-3">
                                <button type="button"
                                        class="inline-flex justify-center rounded-md bg-black border border-gray-300 px-2 py-2 text-base leading-6 font-medium text-gray-100 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        <font-awesome-icon icon="minus" />
                                </button>
                            </div>
                        </div>

                        <div class="mt-4 mb-4">
                            <label for="title" class="block text-gray-700 text-sm font-bold mb-2">Note Title :</label>
                            <input type="text"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                id="title" placeholder="Enter Note Title">
                            <span class="text-red-500">messsage</span>
                        </div>

                        <div class="mt-4 form-group">
                            <label for="body" class="block text-gray-700 text-sm font-bold mb-2">Note</label>
                            <input
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                type="hidden" name="content" id="body">
                            <TrixEditor input="body"/>
                            <span class="text-red-500">message</span>
                        </div>

                        <div>
                            
                        </div>

                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                            <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                <button type="button"
                                    class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                    Save
                                </button>
                            </span>
                            <a href="/notes">
                                <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                    <button type="button"
                                        class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Cancel
                                    </button>
                                </span>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  </div>
</template>

<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'
import TrixEditor from '../layout/TrixEditor.vue';


</script>